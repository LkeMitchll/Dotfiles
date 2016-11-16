" ===============================
" Syntax
" ===============================
au BufRead,BufNewFile *.zsh-theme,*.zsh set filetype=zsh
au BufRead,BufNewFile *.vimrc,*.vimrc.*,*.vim set filetype=vim
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
