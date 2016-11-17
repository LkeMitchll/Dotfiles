" ===============================
" VIMRC LOCAL - LUKE MITCHELL
" ===============================

" ===============================
" General Settings
" ===============================
let mapleader = " "

set shell=/usr/local/bin/zsh
set clipboard=unnamed
set noeb vb t_vb=
set nocompatible
set autochdir
set autoindent
set autowrite
set laststatus=2
set history=50
set textwidth=0
set backspace=2

" Don't backup or swap
set nobackup
set nowritebackup
set noswapfile

" Set some (not so) invisble characters
set list
set listchars=tab:»·,eol:¬,extends:…,precedes:…,space:·,nbsp:·,trail:#

" Tabs
set smartindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Number column
set number
set numberwidth=5
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
set smartcase
set incsearch

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

" ===============================
" Other settings
" ===============================

source $HOME/.vim/theme.vim     " colorscheme related tweaks
source $HOME/.vim/syntax.vim    " syntax plugins and bindings
source $HOME/.vim/plugins.vim   " plugin settings
source $HOME/.vim/keyboard.vim  " custom keyboard shortcuts
source $HOME/.vim/functions.vim " custom functions

" Use some tweaks if running a GUI version
if has("gcgui_running")
  so ~/.gvimrc
endif
