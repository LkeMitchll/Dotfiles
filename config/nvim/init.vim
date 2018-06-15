" Leader key
let mapleader = "\<Space>"
" Find tags in local git folder
set tags+=.git/tags;/
" Use the * register for yanks
set clipboard=unnamed
" Invisble characters
set list listchars+=eol:¬,space:·,trail:#
" Tabs
set smartindent expandtab shiftround
set softtabstop=2 tabstop=2 shiftwidth=2
" Number column
set number relativenumber
" Split behaviour
set splitbelow splitright
" Fold behaviour
set foldmethod=indent foldnestmax=1 foldlevelstart=99
" Spelling
set spellfile=$HOME/.config/nvim/vim-spell-en.utf-8.add
set complete+=kspell completeopt-=preview
" Diffs
set diffopt+=vertical
" Statusline
set statusline=\ %f%< " filename
set statusline+=%=%y\  " filetype
" Show substition updates in context
set inccommand=nosplit

" Cursorline
set cursorline
if &diff
  set nocursorline
else
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
endif

" Netrw (folders)
let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"
let g:netrw_browse_split=3
let g:netrw_liststyle=3
let g:netrw_banner=0

" Set grep command
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

source $XDG_CONFIG_HOME/nvim/plugins.vim  " plugin settings
source $XDG_CONFIG_HOME/nvim/keyboard.vim " custom keyboard shortcu
