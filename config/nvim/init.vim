let mapleader="\<Space>"
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
nmap <leader>e :Explore<CR>
" ALE
nmap <leader>p :ALEFix<CR>
" Gina
nmap <leader>gr :Gina<Space>
nmap <leader>gs :Gina status -s<CR>
nmap <leader>go :Gina commit<CR>
" COC
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <C-T> :CocList files<CR>
nmap <leader>b :CocList buffers<CR>
nmap <leader>a :CocList grep<CR>
nmap <leader>l :CocList<CR>

source ~/.config/nvim/colors.vim
