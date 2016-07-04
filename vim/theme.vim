" ==============================
" Theme
" ==============================
set background=dark
colorscheme gruvbox

" | Basic |
:hi Comment ctermfg=8 cterm=italic guifg=darkgrey
:hi Nontext ctermfg=239 guifg=darkgrey

" | Cursor |
:hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
:hi CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

" | Line No's |
:hi LineNr ctermbg=NONE ctermfg=12
:hi CursorLineNr ctermbg=NONE ctermfg=5
:hi ColorColumn ctermbg=236

" | Splits |
:hi VertSplit ctermbg=NONE ctermfg=4

" | Gutter |
:hi clear SignColumn
:hi SignColumn guibg=NONE ctermbg=NONE
:hi SyntasticWarningSign ctermbg=NONE ctermfg=11
:hi SyntasticErrorSign ctermbg=NONE ctermfg=9
:hi GitGutterAdd ctermbg=NONE
:hi GitGutterChange ctermbg=NONE
:hi GitGutterDelete ctermbg=NONE
:hi GitGutterChangeDelete ctermbg=NONE

" | Sneak |
:hi SneakPluginTarget ctermbg=5
