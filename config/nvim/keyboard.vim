" Don't show tutorial warning on <C-c>
map <C-c> <silent> <C-c>
" Reload config
nmap <F12> :source ~/.config/nvim/init.vim<CR>
" Open netrw
nmap <Leader>e :Sexplore<CR>
" Split lines
nmap K i<CR><Esc>
" Remove trailing whitespace
nmap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Remove highlight
nmap <silent> <Leader>n :nohl<CR>
" Reindent whole file
map <F7> mzgg=G`z
" Pane navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" FZF
""" Find files
nmap <C-T> :Files<CR>
""" Grep files
nmap <Leader>a :Ag<Space>
""" Find buffers
nmap <Leader>b :Buffers<CR>
" ALE
nmap <Leader>p :ALEFix<CR>
" Gina
nmap <leader>gr :Gina<Space>
nmap <leader>gs :Gina status -s --opener=split<CR>
nmap <leader>go :Gina commit<CR>
