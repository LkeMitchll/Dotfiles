" ==============================
" Keyboard Shortcuts
" ==============================

" Fixes InsertLeave on Ctrl-C
inoremap <C-C> <Esc>
" Don't show tutorial warning
nnoremap <C-c> <silent> <C-c>

" Fixes for neovim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
tnoremap <Esc> <C-\><C-n>

" Never enter ex mode
nnoremap Q <nop>
" Never open command history
nnoremap q: <nop>

" Split lines
nnoremap K i<CR><Esc>

" Refresh vim after a config change
map <Leader>rv :so ~/.config/nvim/init.vim<CR>

" Remove trailing whitespace [f5]
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Registers
nnoremap <Leader>re :registers<CR>

" Remove highlight
nnoremap <silent> <Leader>n :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
