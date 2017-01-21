" ==============================
" Theme
" ==============================

set background=dark
colorscheme noctu

" Line No's
hi CursorLineNr ctermbg=NONE

" Splits
hi VertSplit ctermbg=NONE ctermfg=blue

" Gutter
hi SignColumn ctermbg=NONE
hi SyntasticWarningSign ctermbg=NONE ctermfg=yellow
hi SyntasticErrorSign ctermbg=NONE ctermfg=red
hi GitGutterAdd ctermbg=NONE ctermfg=green
hi GitGutterChange ctermbg=NONE ctermfg=green
hi GitGutterDelete ctermbg=NONE ctermfg=red
hi GitGutterChangeDelete ctermbg=NONE ctermfg=yellow

" Statusline
hi StatusLine ctermbg=black ctermfg=gray
hi StatusLineNC ctermbg=black ctermfg=darkgray
au InsertEnter * hi StatusLine ctermbg=black ctermfg=yellow
au InsertLeave * hi StatusLine ctermbg=black ctermfg=gray
hi User1 ctermbg=black ctermfg=red
hi User2 ctermbg=black ctermfg=green

" CSS Vendor Prefixes
hi VendorPrefix ctermfg=cyan
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
