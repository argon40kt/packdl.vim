## packdl.vim

The minimum Vim/Neovim plugin downloader/installer

## Quick reference

First, download this plugin in vim package directory.
*nix:
```bash
$#Vim:
$cd $HOME/.vim/pack/argon/start/packdl.vim/
$#Neovim:
$cd $HOME/.local/share/nvim/site/pack/argon/start/packdl.vim/
$git clone https://github.com/argon40kt/packdl.vim
```

Windows:
```bat
rem Vim:
cd C:\Users\USERNAME\vimfiles\pack\argon\start\packdl.vim\
rem Neovim:
cd C:\Users\USERNAME\AppData\Local\nvim-data\site\pack\argon\start\packdl.vim\
git clone https://github.com/argon40kt/packdl.vim
```

You can set the git repositories of Vim plugin for download source in "g:gitrepos". "g:gitrepos" should be list type and the repositories should be full URL path. 

```vim
"Define plugin git repositories
let g:gitrepos=['https://github.com/dense-analysis/ale.git',
	\	'https://github.com/lervag/vimtex.git',
	\	'https://github.com/puremourning/vimspector.git',
	\	'https://github.com/previm/previm.git']
```

If you would like to change default git command, you can set the variable "g:gitcmd".

```vim
"For example, use git command from WSL on Windows platform
if has('win32')
    g:gitcmd='wsl git'
else
"It is possible to assign the full path of git command
    let g:gitcmd='/usr/bin/git'
endif
```

After set up, execute `:Packinstall`, then all plugins described in `g:gitrepos` will be installed.

## How to update plugins

plugdl.vim does not have plugin update function. It is possible to update plugins by `git pull` command directly. plugdl.vim clones Vim plugins repositories in the following directories.

```
*nix:
Vim: $HOME/.vim/pack/ACCOUNT_NAME/start/PLUGINS_NAME/
Neovim: $HOME/.local/share/nvim/site/pack/ACCOUNT_NAME/start/PLUGINS_NAME/

Windows:
Vim: $HOME\vimfiles\pack\ACCOUNT_NAME\start\PLUGINS_NAME\
Neovim: $HOME\AppData\Local\nvim-data\site\pack\ACCOUNT_NAME\start\PLUGINS_NAME
```

So, it is possible to go to each directories for environment and update each plugins.

 - ex) Vim on *nix environment
```bash
$cd /home/USER_NAME/.vim/pack/ACCOUNT_NAME/start/PLUGINS_NAME/
$git pull
```
After update plugins, you should update plugin documents. Change directories to above plugin installed directory and run `:helptags ./doc` command on Vim/Neovim.

## How to remove plugins

This plugin does not remove plugin function, but it is possible to remove
plugins manually by remove package installed directory.
The install directory is described in ["How to update plugins"](#how-to-update-plugins) section.
After remove directory, you should remove the removed plugin in |g:gitrepos| to prevent reinstall the plugin.

## Lincence

plugdl.vim is MIT licenced. you can copy, redistribute and modify freely.
