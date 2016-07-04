" ===============================
" Keyboard Shortcuts
" ===============================

" | Reload This file |
map <Leader>rv :so ~/.vimrc.local<CR>

" | bind K to grep word under cursor |
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" | Remove trailing whitespace [f5] |
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" | Error navigation |
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

" | Registers |
nnoremap <Leader>r :reg<CR>
