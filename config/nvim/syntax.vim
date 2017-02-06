" ==============================
" Syntax
" ==============================

au BufRead,BufNewFile ~/.dotfiles/* set filetype=config
au BufRead,BufNewFile git-rebase* set filetype=gitrebase
au BufRead,BufNewFile COMMIT_* set filetype=gitcommit
au BufRead,BufNewFile *.zsh-theme,*.zsh set filetype=zsh
au BufRead,BufNewFile *.vim set filetype=vim
au BufRead,BufNewFile tmux.conf set filetype=tmux

let g:html_indent_tags = 'li\|p\|span'
let g:jsx_ext_required = 0
