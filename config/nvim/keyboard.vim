" Fixes
" Don't show tutorial warning on <C-c>
nnoremap <C-c> <silent> <C-c>
" Never enter ex mode
nnoremap Q <nop>
" Don't show command history
nnoremap q: <nop>

" Shortcuts
" Open netrw
nnoremap <Leader>e :Sexplore<CR>
" Split lines (opposite of j)
nnoremap K i<CR><Esc>
" Remove trailing whitespace [f5]
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Remove highlight
nnoremap <silent> <Leader>n :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Plugins
" FZF
""" Find files
nnoremap <C-T> :Files<CR>
""" Grep files
nmap <Leader>a :Ag<Space>
""" Find buffers
nnoremap <Leader>b :Buffers<CR>

" Gina
map <leader>gr :Gina<Space>
map <leader>gs :Gina status -s<CR>
map <leader>go :Gina commit<CR>

" VTR (Vim Tmux Runner)
let g:VtrClearSequence = ""
map <Leader>ta :VtrAttachToPane<CR>1<CR>
map <Leader>tr :VtrFlushCommand<cr>:VtrSendCommandToRunner<cr>
map <Leader>tl :VtrSendCommandToRunner<cr>
map <Leader>tc :VtrClearRunner<cr>
