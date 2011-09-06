"general
set nocompatible
"turn on syntax highlighting
syntax on
"load ft plugin and indent files
filetype plugin indent on
set backupdir=~/.vim/backup
"highlight searches by default
set hlsearch
set history=100
set ruler
"allow backspacing over everything in insert mode
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
