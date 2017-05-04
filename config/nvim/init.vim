" ==============================
" VIMRC - LUKE MITCHELL
" ==============================

let mapleader = " "
set shell=/usr/local/bin/zsh
set tags+=.git/tags;/
set clipboard=unnamed
set autowrite
set autoread
set backspace=2
set formatoptions+=j
set formatoptions-=o
set noerrorbells visualbell t_vb=
set nocompatible
set scrolloff=999
set textwidth=0
set ttimeout
set ttimeoutlen=100
set wildmenu
set nowrap

" Don't backup or swap
set nobackup
set nowritebackup
set noswapfile

" Set some (not so) invisble characters
set list
set listchars=tab:>\ ,eol:¬,extends:…,precedes:…,space:·,trail:#

" Tabs
set smartindent
set autoindent
set expandtab
set shiftround
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Number column
set number
set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set number
    set relativenumber
  endif
endfunc
autocmd InsertEnter,InsertLeave * :call NumberToggle()

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
set statusline+=%=%y

" Set grep command (ag)
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --silent
endif

" ==============================
" Other settings
" ==============================

source $HOME/.config/nvim/plugins.vim   " plugin settings
source $HOME/.config/nvim/theme.vim     " colorscheme related tweaks
source $HOME/.config/nvim/syntax.vim    " syntax plugins and bindings
source $HOME/.config/nvim/keyboard.vim  " custom keyboard shortcuts
