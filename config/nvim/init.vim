set shell=/usr/local/bin/fish
let mapleader="\<Space>"
set clipboard=unnamed inccommand=nosplit
set cursorline number relativenumber scrolloff=999
set list listchars+=eol:¬,space:·,trail:
set smartindent expandtab shiftround nowrap
set softtabstop=2 tabstop=2 shiftwidth=2
set splitbelow splitright diffopt+=vertical
colorscheme interrobang

" Keyboard shortcuts
nmap <C-]> :cnext<CR>

" Fugitive
nmap <leader>gr :Git<Space>
nmap <leader>gs :Git<CR>
nmap <leader>go :Git commit<CR>
nmap <leader>gi :Git rebase -i<CR>

" COC
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <C-T> :CocList files<CR>
imap <C-j> <Plug>(coc-snippets-expand-jump)
nmap <leader>ac :CocCommand actions.open<CR>
nmap <leader>ag :CocList grep<CR>
nmap <leader>b :CocList buffers<CR>
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>d :CocDiagnotics<CR>
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>l :CocList<CR>
nmap <leader>p :call CocAction('format')<CR>




let g:node_client_debug = 1
