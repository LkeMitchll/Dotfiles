set shell=/usr/local/bin/fish
let mapleader="\<Space>"
set clipboard=unnamed inccommand=nosplit
set cursorline number relativenumber scrolloff=999
set list listchars+=eol:¬,space:·,trail:
set smartindent expandtab shiftround nowrap
set softtabstop=2 tabstop=2 shiftwidth=2
set splitbelow splitright diffopt+=vertical
colorscheme interrobang

" Gina
nmap <leader>gr :Gina<Space>
nmap <leader>gs :Gina status --opener=split<CR>
nmap <leader>go :Gina commit<CR>

" Floaterm
nmap <leader>tr :exe ':FloatermNew --height=0.8 --width=0.8 ' . input('Command: ')<CR>
tnoremap <Esc> <C-\><C-n>:FloatermHide<CR>
nmap <leader>tl :FloatermShow<CR>

" COC
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <C-T> :CocList files<CR>
nmap <leader>b :CocList buffers<CR>
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>a :CocList grep<CR>
nmap <leader>l :CocList<CR>
nmap <leader>p :call CocAction('format')<CR>
nmap <leader>s :CocCommand document.renameCurrentWord<CR>
imap <C-j> <Plug>(coc-snippets-expand-jump)
