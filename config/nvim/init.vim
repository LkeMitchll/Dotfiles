let mapleader = "\<Space>"
set shell=/usr/local/bin/zsh
set tags+=.git/tags;/
set clipboard=unnamed
set autowrite
set autoread
set formatoptions-=o
set noerrorbells visualbell t_vb=
set nocompatible
set textwidth=0
set nowrap
set scrolloff=999

" Don't backup or swap
set nobackup
set nowritebackup
set noswapfile

" Set some (not so) invisble characters
set list
set listchars+=eol:¬,space:·

" Tabs
set smartindent
set expandtab
set shiftround
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Cursorline
set cursorline
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" Number column
set number
set relativenumber

" Splits
set splitbelow
set splitright

" Folds
setglobal foldmethod=indent
setglobal foldnestmax=1
setglobal foldlevelstart=99

" Spelling
set exrc
set spellfile=$HOME/.vim-spell-en.utf-8.add
set complete+=kspell
set completeopt-=preview

" Diffs
set diffopt+=vertical

" Language encoding
setglobal langmenu=en_GB.UTF-8
setglobal fileencoding=utf-8

" Searching
set hlsearch
set ignorecase
set smartcase
set incsearch

" Statusline
set showtabline=2
" Filename
set statusline=\ %f%<
" Filetype
set statusline+=%=%y

" Set grep command (ag)
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --silent
endif

source $HOME/.config/nvim/plugins.vim   " plugin settings
source $HOME/.config/nvim/keyboard.vim  " custom keyboard shortcuts
