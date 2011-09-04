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

"initialize pathogen
call pathogen#infect('plugins')

source ~/.vim/rc/functions.vim
source ~/.vim/rc/keys.vim
source ~/.vim/rc/my_vimrc
colorscheme vibrantink
