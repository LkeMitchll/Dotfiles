let mapleader = "\<Space>"
set tags+=.git/tags;/
set clipboard=unnamed
set list listchars+=eol:¬,space:·,trail:
set smartindent expandtab shiftround
set softtabstop=2 tabstop=2 shiftwidth=2
set number relativenumber
set splitbelow splitright
set complete+=kspell
set diffopt+=vertical
set inccommand=nosplit
set scrolloff=999
let g:netrw_liststyle=3
let g:netrw_banner=0

set cursorline
if &diff
  set nocursorline
else
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
endif

source ~/.config/nvim/keyboard.vim
source ~/.config/nvim/plugins.vim
