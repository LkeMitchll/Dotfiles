let mapleader = "\<Space>"
set clipboard=unnamed
set complete+=kspell
set diffopt+=vertical
set inccommand=nosplit
set list listchars+=eol:¬,space:·,trail:
set number relativenumber
set scrolloff=999
set smartindent expandtab shiftround
set softtabstop=2 tabstop=2 shiftwidth=2
set splitbelow splitright
set tags+=.git/tags;/

let g:netrw_banner=0
let g:netrw_liststyle=3

set cursorline

source ~/.config/nvim/keyboard.vim
source ~/.config/nvim/plugins.vim
