" ==============================
" Theme
" ==============================

set background=dark
colorscheme gruvbox

" Line No's
hi CursorLineNr ctermbg=NONE

" Splits
hi VertSplit ctermbg=black ctermfg=black

" Gutter
hi SignColumn ctermbg=NONE
hi SyntasticWarningSign ctermbg=NONE ctermfg=yellow
hi SyntasticErrorSign ctermbg=NONE ctermfg=red
hi GitGutterAdd ctermbg=NONE ctermfg=green
hi GitGutterChange ctermbg=NONE ctermfg=green
hi GitGutterDelete ctermbg=NONE ctermfg=red
hi GitGutterChangeDelete ctermbg=NONE ctermfg=yellow

" CSS Vendor Prefixes
hi VendorPrefix ctermfg=cyan
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
