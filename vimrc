" ==============================
" VIMRC LOCAL - LUKE MITCHELL
" ==============================
let mapleader = " "

set shell=/usr/local/bin/zsh
set clipboard=unnamed
set autochdir
set autoindent
set autowrite
set autoread
set backspace=2
set formatoptions+=j
set history=1000
set noeb vb t_vb=
set nocompatible
set scrolloff=1
set textwidth=0
set ttimeout
set ttimeoutlen=100
set wildmenu

" Don't backup or swap
set nobackup
set nowritebackup
set noswapfile

" Set some (not so) invisble characters
set list
set listchars=tab:>\ ,eol:¬,extends:…,precedes:…,space:·,trail:#

" Tabs
set smartindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Number column
set number
set relativenumber

" Splits
set splitbelow
set splitright

" Spelling
set spellfile=$HOME/.vim-spell-en.utf-8.add
set complete+=kspell
set diffopt+=vertical

" Language encoding
setglobal langmenu=en_GB.UTF-8
setglobal encoding=utf8
setglobal fileencoding=utf-8

" Searching
set hlsearch
set ignorecase
set smartcase
set incsearch

" Statusline
set laststatus=2
set showtabline=2
" Filename
set statusline=\ %f%<
" Filetype
set statusline+=%2*%=%y
" Current/total lines
set statusline+=\ %l\/%L
" Ale errors
set statusline+=\ %1*%{ALEGetStatusLine()}\ 

filetype plugin indent on

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" ==============================
" Other settings
" ==============================

source $HOME/.vim/theme.vim     " colorscheme related tweaks
source $HOME/.vim/syntax.vim    " syntax plugins and bindings
source $HOME/.vim/plugins.vim   " plugin settings
source $HOME/.vim/keyboard.vim  " custom keyboard shortcuts
source $HOME/.vim/functions.vim " custom functions

" Use some tweaks if running a GUI version
if has("gcgui_running")
  so ~/.gvimrc
endif
