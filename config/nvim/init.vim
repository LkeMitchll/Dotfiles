let mapleader="\<Space>"
set clipboard=unnamed
set cursorline relativenumber
set list listchars+=eol:¬,space:·,trail:
set splitbelow
set smartindent expandtab shiftround
set softtabstop=2 tabstop=2 shiftwidth=2
set inccommand=nosplit
colorscheme interrobang

" Fugitive
nmap <leader>gs :G<CR>

" COC
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
imap <C-j> <Plug>(coc-snippets-expand-jump)
nmap <C-T> :CocList files<CR>
nmap <leader>ag :CocList grep<CR>
nmap <leader>b :CocList buffers<CR>
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>d :CocList diagnostics<CR>
nmap <leader>p :call CocAction('format')<CR>
