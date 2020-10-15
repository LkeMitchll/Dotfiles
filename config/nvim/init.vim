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
nmap <leader>gr :Git<Space>
nmap <leader>gs :Git<CR>
nmap <leader>go :Git commit<CR>
nmap <leader>gi :Git rebase -i<CR>

" vim-kitty-runner
let g:KittyUseMaps = 1

" COC
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <leader>cd <Plug>(coc-definition)
nmap <C-T> :CocList files<CR>
nmap <leader>b :CocList buffers<CR>
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>a :CocList grep<Space>
nmap <leader>l :CocList<CR>
nmap <leader>p :call CocAction('format')<CR>
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_filetype_map = {
    \ 'eruby': 'html',
    \ }
