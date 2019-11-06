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
let g:coc_snippet_next = '<tab>'

""" Confirm completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

""" VSCode-like snippet completion with <Tab>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
