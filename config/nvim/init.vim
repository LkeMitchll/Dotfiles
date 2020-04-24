let mapleader="\<Space>"
set clipboard=unnamed inccommand=nosplit
set cursorline number relativenumber scrolloff=999
set list listchars+=eol:¬,space:·,trail:
set smartindent expandtab shiftround
set softtabstop=2 tabstop=2 shiftwidth=2
set splitbelow splitright diffopt+=vertical
colorscheme interrobang

" Gina
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
nmap <leader>p :call CocAction('format')<CR>
