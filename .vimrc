set tags=./tags,../tags;


" Leaders
let maplocalleader = "<space>"

" Enable syntax highlighting
syntax on

set nu		" line numbers
set ai		" auto indent
filetype plugin on


" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
call plug#end()
