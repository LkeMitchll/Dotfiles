let mapleader = "\<Space>"
set clipboard=unnamed
set complete+=kspell inccommand=nosplit
set cursorline number relativenumber scrolloff=999
set list listchars+=eol:¬,space:·,trail:
set smartindent expandtab shiftround
set softtabstop=2 tabstop=2 shiftwidth=2
set splitbelow splitright diffopt+=vertical

call plugpac#begin()
Pack 'k-takata/minpac', {'type': 'opt'}
Pack 'dense-analysis/ale'
Pack 'honza/vim-snippets'
Pack 'justinmk/vim-sneak'
Pack 'knubie/vim-kitty-navigator'
Pack 'lambdalisue/gina.vim'
Pack 'lkemitchll/vim-kitty-runner'
Pack 'neoclide/coc.nvim', {'branch': 'release'}
Pack 'roman/golden-ratio'
Pack 'sheerun/vim-polyglot'
Pack 'styled-components/vim-styled-components', { 'branch': 'main'}
Pack 'tpope/vim-commentary'
Pack 'tpope/vim-sensible'
Pack 'tpope/vim-surround'
call plugpac#end()
packloadall

" Open netrw
nmap <leader>e :silent Sexplore<CR>
" Split lines
nmap K i<CR><Esc>
" Remove highlight
nmap <leader>n :nohl<CR>

" ALE
nmap <leader>p :ALEFix<CR>
" Gina
nmap <leader>gr :Gina<Space>
nmap <leader>gs :Gina status<CR>
nmap <leader>go :Gina commit<CR>
" COC
nmap <C-T> :CocList files<CR>
nmap <leader>b :CocList buffers<CR>
nmap <leader>a :CocList --interactive grep<CR>
nmap <leader>l :CocList<CR>
""" Confirm completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

source ~/.config/nvim/colors.vim
