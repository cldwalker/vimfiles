"general
set nocompatible               "turn on syntax highlighting
syntax on                      "load ft plugin and indent files
filetype plugin indent on
set backupdir=~/.vim/backup
set hlsearch                   "highlight searches by default
set history=100
set ruler
set backspace=indent,eol,start "allow backspacing over everything in insert mode
set showcmd                    "show incomplete cmds down the bottom
set textwidth=100
set viminfo='20,\"50,n~/.vim/viminfo

"tabs + whitespace
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

"completion
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*~           "stuff to ignore when tab completing

"formatting
set formatoptions-=o "dont continue comments when pushing o/O

"scrolling
set scrolloff=3
set sidescrolloff=7

"statusline
set statusline=%f%m%r%h%w "defaults
set statusline+=%y        "filetype
set laststatus=2

"TODO
"set complete +=k
set invsmartcase
set isf+=:
set ww+=h,l
set notagbsearch

"Everything below is specific to this setup
"==========================================

"initialize pathogen
call pathogen#infect('plugins')

"load keys, functions
runtime! rc/*.vim
"load plugin-specific files
runtime! rc/plugins/*.vim

colorscheme vibrantink
