" ==============================
" Theme
" ==============================

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set background=dark
colorscheme gruvbox

" Basic
hi Comment cterm=italic

" Line No's
hi LineNr ctermbg=NONE ctermfg=blue
hi CursorLineNr ctermbg=NONE ctermfg=magenta

" Splits
hi VertSplit ctermbg=NONE ctermfg=blue

" Gutter
hi SignColumn ctermbg=235
hi SyntasticWarningSign ctermbg=NONE ctermfg=yellow
hi SyntasticErrorSign ctermbg=NONE ctermfg=red
hi GitGutterAdd ctermbg=NONE ctermfg=green
hi GitGutterChange ctermbg=NONE ctermfg=green
hi GitGutterDelete ctermbg=NONE ctermfg=red
hi GitGutterChangeDelete ctermbg=NONE ctermfg=yellow

" Sneak
hi SneakPluginTarget ctermbg=magenta
