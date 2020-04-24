let mapleader="\<Space>"
set clipboard=unnamed inccommand=nosplit
set cursorline number relativenumber scrolloff=999
set list listchars+=eol:¬,space:·,trail:
set smartindent expandtab shiftround
set softtabstop=2 tabstop=2 shiftwidth=2
set splitbelow splitright diffopt+=vertical

packadd coc.nvim
packadd gina.vim
packadd vim-commentary
packadd vim-interrobang
packadd vim-kitty-navigator
packadd vim-kitty-runner
packadd vim-polyglot
packadd vim-sensible
packadd vim-sneak
packadd vim-snippets
packadd vim-surround
packloadall

colorscheme interrobang

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
nmap <leader>p :call CocAction('format')<CR>
