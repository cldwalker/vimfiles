" general
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

" tabs + whitespace
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

" command completion
" first tab completes like bash, second tab completes first choice
set wildmode=list:longest,list:full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*~           "stuff to ignore when tab completing

" insert completion
" only complete common characters, show menu + preview
set completeopt=longest,menu,preview
" complete what's in buffers + tags
set complete=.,b,u,t

" formatting
set formatoptions-=o "dont continue comments when pushing o/O

" scrolling
set scrolloff=3
set sidescrolloff=7

" statusline
set statusline=%f%m%r%h%w "defaults
set statusline+=%y        "filetype
set laststatus=2

" search - case only matters if searches contain uppercase chars
set ignorecase
set smartcase

" Everything below is specific to this setup
" ==========================================

" initialize pathogen
call pathogen#infect('plugins')

" load keys, functions
runtime! rc/*.vim
" load plugin-specific files
runtime! rc/plugins/*.vim

colorscheme vibrantink
