"packdl.vim is a minimum Vim/Neovim plugin downloader/installer
"Developer: Kenichi Takizawa
"License: MIT

function packdl#init()
	command! -nargs=0 Packinstall call packdl#packinstall()
endfunc

function packdl#packdir()

if has('nvim')
	if has('win32')
		"Todo, for Nvim win32
		let l:packdir='/AppData/Local/nvim-data/site/pack/'
	else
		let l:packdir='/.local/share/nvim/site/pack/'
	endif
elseif has('win32')
	let l:packdir='/vimfiles/pack/'
else
	let l:packdir='/.vim/pack/'
endif

return l:packdir
endfunc

function packdl#packinstall()

"Check wether global number exists
if !exists("g:gitrepos")
	echoerr "g:gitrepos should be defined"
	return
endif

"Define git command
if !exists("g:gitcmd")
	let g:gitcmd='git'
endif
let l:gitcmd='!' . g:gitcmd . ' '

let l:mycurdir=getcwd()
for gitrepo in g:gitrepos
	let l:gitreponame=reverse(split(trim(gitrepo,'.git'),'/'))[0]
	let l:gitrepoowner=reverse(split(trim(gitrepo,'.git'),'/'))[1]
	let l:packdir=packdl#packdir()
	let l:gitlocal=resolve($HOME . l:packdir . l:gitrepoowner . '/start') . '/'
	let l:gittarget=l:gitlocal . l:gitreponame
	try
		silent exe 'lcd ' . l:gitlocal
	catch
	"	echo l:gitlocal
		call mkdir(l:gitlocal, "p")
	endtry
	"echo finddir('.git', l:gittarget, 0)
	"echo l:gittarget . '/.git'
	try
		silent exe 'lcd ' . l:gittarget . '/.git'
		echo gitrepo . ' is already installed.' |
	catch
		silent exe 'lcd ' . l:gitlocal
		exe l:gitcmd . ' clone ' . gitrepo |
		silent exe 'helptags ' . l:gitreponame . '/doc'
	endtry
endfor

silent exe 'lcd ' . l:mycurdir
endfunc

