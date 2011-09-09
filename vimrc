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
set showcmd     "show incomplete cmds down the bottom

"tabs + whitespace
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*~           "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O
set scrolloff=3
set sidescrolloff=7

"statusline setup
set statusline=%f%m%r%h%w "defaults
set statusline+=%y        "filetype
set laststatus=2

set textwidth=100
colorscheme vibrantink

"TODO
"set complete +=k
set invsmartcase
set isf+=:
set ww+=h,l
set notagbsearch

"initialize pathogen
call pathogen#infect('plugins')

"load keys, functions
runtime! rc/*.vim
"load plugin-specific files
runtime! rc/plugins/*.vim
