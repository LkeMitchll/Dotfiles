" Init Dein
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('~/Git/vim-interrobang')
  call dein#add('tpope/vim-sensible')

  call dein#add('christoomey/vim-tmux-runner')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('dhruvasagar/vim-prosession', { 'depends': 'tpope/vim-obsession' })
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('junegunn/fzf.vim')
  call dein#add('justinmk/vim-sneak')
  call dein#add('lambdalisue/gina.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-obsession')
  call dein#add('roman/golden-ratio')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('w0rp/ale')

  call dein#end()
  call dein#save_state()
endif

" Theme
colorscheme interrobang

" FZF
set runtimepath+=/usr/local/opt/fzf
""" Custom ripgrep command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

" Ale
set statusline+=\ %1*%{ALEGetStatusLine()}\ 

" Deocomplete
let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 5000000

" Surround
let g:surround_45 = "<% \r %>" " on hyphen
let g:surround_61 = "<%= \r %>" " on equals

" Prosession
let g:prosession_dir = '~/.config/nvim/sessions'

" Syntaxes
autocmd BufNewFile,BufRead *.css set filetype=css.css4
