" Don't show tutorial warning on <C-c>
nnoremap <C-c> <silent> <C-c>
" Never enter ex mode
nnoremap Q <nop>

" Split lines (opposite of j)
nnoremap K i<CR><Esc>
" Refresh vim after a config change
map <Leader>rv :so ~/.config/nvim/init.vim<CR>
" Remove trailing whitespace [f5]
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Remove highlight
nnoremap <silent> <Leader>n :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
