" ===============================
" Keyboard Shortcuts
" ===============================

" Reload This file
map <Leader>rv :so ~/.vimrc<CR>

" Remove trailing whitespace [f5]
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Error navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

" Registers
nnoremap <Leader>r :registers<CR>

" Remove highlight
map <Leader>n :nohlsearch<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
