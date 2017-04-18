" ==============================
" Theme
" ==============================

set background=dark
colorscheme noctu

" Line No's
hi CursorLineNr ctermbg=NONE

" Gutter
hi SignColumn ctermbg=NONE
hi SignifySignAdd ctermfg=green
hi SignifySignDelete ctermfg=red
hi SignifySignChange ctermfg=yellow

" Statusline
hi StatusLine ctermbg=black ctermfg=gray
hi StatusLineNC ctermbg=black ctermfg=darkgray
au InsertEnter * hi StatusLine ctermbg=black ctermfg=yellow
au InsertLeave * hi StatusLine ctermbg=black ctermfg=gray
hi User1 ctermbg=black ctermfg=red
hi User2 ctermbg=black ctermfg=green

" FZF
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Sneak
hi Sneak ctermbg=red

" CSS Vendor Prefixes
hi VendorPrefix ctermfg=cyan
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
