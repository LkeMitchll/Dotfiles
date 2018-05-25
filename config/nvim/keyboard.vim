" Fixes
" Don't show tutorial warning on <C-c>
map <C-c> <silent> <C-c>
" Never enter ex mode
map Q <nop>
" Don't show command history
map q: <nop>

" Shortcuts
" Reload config
nmap <F12> :source ~/.config/nvim/init.vim<CR>
" Open netrw
nmap <Leader>e :Sexplore<CR>
" Split lines (opposite of j)
nmap K i<CR><Esc>
" Remove trailing whitespace
nmap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Remove highlight
nmap <silent> <Leader>n :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Plugins
" FZF
""" Find files
nmap <C-T> :Files<CR>
""" Grep files
nmap <Leader>a :Ag<Space>
""" Find buffers
nmap <Leader>b :Buffers<CR>

" Gina
nmap <leader>gr :Gina<Space>
nmap <leader>gs :split <CR> :Gina status -s<CR>
nmap <leader>go :Gina commit<CR>

" VTR (Vim Tmux Runner)
let g:VtrClearSequence = ""
nmap <Leader>ta :VtrAttachToPane<CR>1<CR>
nmap <Leader>tr :VtrFlushCommand<cr>:VtrSendCommandToRunner<cr>
nmap <Leader>tl :VtrSendCommandToRunner<cr>
nmap <Leader>tc :VtrClearRunner<cr>
