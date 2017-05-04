set background=dark

" Gutter
hi SignColumn ctermbg=NONE
hi CursorLineNr ctermbg=NONE
hi SignifySignAdd ctermfg=green
hi SignifySignDelete ctermfg=red
hi SignifySignChange ctermfg=yellow

" Statusline
hi StatusLine ctermbg=black ctermfg=gray
hi StatusLineNC ctermbg=black ctermfg=darkgray
au InsertEnter * hi StatusLine ctermbg=black ctermfg=yellow
au InsertLeave * hi StatusLine ctermbg=black ctermfg=gray
" Ale (StatusLine)
hi User1 ctermbg=black ctermfg=red

" Sneak
hi Sneak ctermbg=red

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
