" ===============================
" Keyboard Shortcuts
" ===============================

" | Reload This file |
map <Leader>rv :so ~/.vimrc.local<CR>

" | Remove trailing whitespace [f5] |
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" | Error navigation |
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

" | Registers |
nnoremap <Leader>r :reg<CR>
