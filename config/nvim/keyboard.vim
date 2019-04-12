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

" FZF
""" Find files
nmap <C-T> :Files<CR>
""" Grep files
nmap <leader>a :Ag<Space>
""" Find buffers
nmap <leader>b :Buffers<CR>
" ALE
nmap <leader>p :ALEFix<CR>
" Gina
nmap <leader>gr :Gina<Space>
nmap <leader>gs :Gina status<CR>
nmap <leader>go :Gina commit<CR>
