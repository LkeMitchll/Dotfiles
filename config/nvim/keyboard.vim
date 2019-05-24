" Open netrw
nmap <leader>e :silent Sexplore<CR>
" Split lines
nmap K i<CR><Esc>
" Remove highlight
nmap <leader>n :nohl<CR>
" Delete all buffers
map <F2> :bufdo :bd<CR>
" Remove trailing whitespace
nmap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Reindent whole file
map <F4> mzgg=G`z
" Sort visually highlighted lines
vmap <F5> :'<,'>sort<CR>
" Reload config
nmap <F12> :source ~/.config/nvim/init.vim<CR>

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
nmap <leader>l :<C-u>CocList<CR>
nmap <silent>[c <Plug>(coc-diagnostic-prev)
nmap <silent>]c <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)

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

let g:coc_snippet_next = '<tab>'
