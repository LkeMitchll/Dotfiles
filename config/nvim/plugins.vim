" Init Dein
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim', {'on_cmd': 'Dein'})

  call dein#add('christoomey/vim-tmux-runner', {'on_cmd': 'VtrAttachToPane'})
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('joereynolds/vim-minisnip', {'on_map': {'i': '<TAB>'}})
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim', {'on_cmd': 'Files'})
  call dein#add('justinmk/vim-sneak', {'on_map': {'n': ['s', 'S']}})
  call dein#add('lambdalisue/gina.vim', {'on_cmd': 'Gina'})
  call dein#add('lkemitchll/vim-interrobang')
  call dein#add('mattn/emmet-vim', {'on_map': {'n': ['<C-y>,']}})
  call dein#add('tpope/vim-commentary', {'on_map': {'n': ['gcc']}})
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys']}})
  call dein#add('roman/golden-ratio')
  call dein#add('roxma/nvim-completion-manager', {'on_event': 'InsertEnter'})
  call dein#add('sheerun/vim-polyglot')
  call dein#add('w0rp/ale')

  call dein#end()
  call dein#save_state()
endif

" Theme
colorscheme interrobang

" Ale
set statusline+=\ %1*%{ALEGetStatusLine()}\ 

" Surround
let g:surround_{char2nr("-")} = "<% \r %>"
let g:surround_{char2nr("=")} = "<%= \r %>"

" Minisnip
let g:minisnip_dir = '~/.config/nvim/minisnip'
