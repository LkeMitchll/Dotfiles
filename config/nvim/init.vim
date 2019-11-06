let mapleader = "\<Space>"
set clipboard=unnamed
set cmdheight=2
set complete+=kspell
set cursorline
set diffopt+=vertical
set inccommand=nosplit
set list listchars+=eol:¬,space:·,trail:
set number relativenumber
set scrolloff=999
set shortmess+=c
set signcolumn=yes
set smartindent expandtab shiftround
set softtabstop=2 tabstop=2 shiftwidth=2
set splitbelow splitright
set tags+=.git/tags;/

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keyboard.vim
source ~/.config/nvim/colors.vim
