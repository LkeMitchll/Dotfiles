" ===============================
" VIMRC vOCAL - LUKE MITCHELL
" ===============================

" Use some tweaks if runnin a GUI version
if has('gui_running')
  so ~/.gvimrc
endif

" ===============================
" General Settings
" ===============================
let mapleader = " "

set autochdir                " Automatically change dirs for ':e'
set autoindent               " Self-explanatory
set autowrite                " Automatically :write before running commands
set shell=/usr/local/bin/zsh " Set shell
set noeb vb t_vb=            " Disable bells
set hlsearch                 " Highlight searched term
set nocompatible             " Disable vi-compatibility
set laststatus=2             " Always show the statusline
set clipboard=unnamed        " use system clipboard
set ignorecase               " Case-insensitive tab completion
set numberwidth=5            " Width of the number column
set relativenumber           " Line numbers relative to current line
set textwidth=0              " Don't automatically break lines after x chars
set backspace=2              " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler                     " show the cursor position all the time
set showcmd                   " display incomplete commands
set incsearch                 " do incremental searching
set laststatus=2              " Always display the status line
set nojoinspaces
set number
set numberwidth=5
set splitbelow
set splitright

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

" Spelling
set spellfile=$HOME/.vim-spell-en.utf-8.add
set complete+=kspell
set diffopt+=vertical

" Language encoding
setglobal langmenu=en_GB.UTF-8
setglobal encoding=utf8
setglobal fileencoding=utf-8

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
