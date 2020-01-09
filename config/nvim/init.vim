let mapleader="\<Space>"
set clipboard=unnamed inccommand=nosplit
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
call minpac#add('machakann/vim-sandwich')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('sheerun/vim-polyglot')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-sensible')
packloadall

" Gina
call gina#custom#mapping#nmap('status', '<C-K>', ':KittyNavigateUp<CR>')
nmap <leader>gr :Gina<Space>
nmap <leader>gs :Gina status --opener=split<CR>
nmap <leader>go :Gina commit --opener=split<CR>
" COC
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <C-T> :CocList files<CR>
nmap <leader>b :CocList buffers<CR>
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>a :CocList grep<CR>
nmap <leader>l :CocList<CR>
nmap <leader>p :CocCommand prettier.formatFile<CR>

source ~/.config/nvim/colors.vim
