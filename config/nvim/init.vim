let mapleader="\<Space>"
set clipboard=unnamed
set complete+=kspell inccommand=nosplit
set cursorline number relativenumber scrolloff=999
set list listchars+=eol:¬,space:·,trail:
set smartindent expandtab shiftround
set softtabstop=2 tabstop=2 shiftwidth=2
set splitbelow splitright diffopt+=vertical

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('honza/vim-snippets')
call minpac#add('justinmk/vim-sneak')
call minpac#add('knubie/vim-kitty-navigator')
call minpac#add('lambdalisue/gina.vim')
call minpac#add('lkemitchll/vim-kitty-runner')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('sheerun/vim-polyglot')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-surround')
packloadall

" Open netrw
nmap <leader>e :Explore<CR>
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
nmap <leader>p :CocCommand prettier.formatFile<CR>

source ~/.config/nvim/colors.vim
