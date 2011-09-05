"general
set nocompatible
syntax on
filetype plugin indent on
set backupdir=~/.vim/backup
set hlsearch
set history=50
set ruler
set backspace=indent,eol,start
set viminfo='20,\"50,n~/.vim/viminfo

"tabs + whitespace
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

"TODO
"set complete +=k
set wildmode=list:longest
set invsmartcase
set isf+=:
set ww+=h,l
set textwidth=100
set notagbsearch

"initialize pathogen
call pathogen#infect('plugins')

source ~/.vim/rc/functions.vim
source ~/.vim/rc/keys.vim
source ~/.vim/rc/plugins.vim
colorscheme vibrantink
