" Disable old features
set nocompatible
" Specifically set the shell bin
set shell=/usr/local/bin/zsh
" Leader key
let mapleader = "\<Space>"
" Find tags in local git folder
set tags+=.git/tags;/
" Use the * register for yanks
set clipboard=unnamed
" Auto write files when leaving buffer
set autowrite
" Disable error flashes
set noerrorbells visualbell t_vb=
" Don't wrap lines
set nowrap
" Keep cursorline centered when scrolling
set scrolloff=999

" Don't backup or swap
set nobackup
set nowritebackup
set noswapfile

" Invisble characters
set list
set listchars+=eol:¬,space:·,trail:#

" Tabs
set smartindent
set expandtab
set shiftround
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Cursorline
set cursorline
if &diff
  set nocursorline
else
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
endif

" Number column
set number
set relativenumber

" Split behaviour
set splitbelow
set splitright

" Fold behaviour
setglobal foldmethod=indent
setglobal foldnestmax=1
setglobal foldlevelstart=99

" Spelling
set exrc
set spellfile=$HOME/confg/nvim/vim-spell-en.utf-8.add
set complete+=kspell
set completeopt-=preview

" Diffs
set diffopt+=vertical

" Netrw (folders)
let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"
let g:netrw_browse_split=3
let g:netrw_liststyle=3
let g:netrw_banner=0

" Statusline
""" Filename
set statusline=\ %f%<
""" Filetype
set statusline+=%=%y\ 

" Set grep command
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

source $XDG_CONFIG_HOME/nvim/plugins.vim   " plugin settings
source $XDG_CONFIG_HOME/nvim/keyboard.vim  " custom keyboard shortcu
