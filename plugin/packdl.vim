" packdl.vim is a minimum Vim/Neovim plugin downloader/installer
" Developer: Kenichi Takizawa
" License: MIT

" Prevent multi loading
if exists("g:did_packdl")
  finish
endif
let g:did_packdl = 1

" Set vim mode and escape default flags to a variable
let s:save_cpo = &cpo
set cpo&vim

call packdl#init()

" Revive default flags and restore plugin mode
let &cpo = s:save_cpo
unlet s:save_cpo
