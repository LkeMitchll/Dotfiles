call plug#begin('~/.local/share/nvim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/neco-syntax' | Plug 'Shougo/context_filetype.vim'
Plug 'joereynolds/vim-minisnip' | Plug '~/Git/deoplete-minisnip'
Plug 'justinmk/vim-sneak'
Plug 'knubie/vim-kitty-navigator'
Plug 'lambdalisue/gina.vim'
Plug 'mattn/emmet-vim'
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'sheerun/vim-polyglot' | Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug '~/Git/vim-interrobang'
Plug '~/Git/vim-kitty-runner'
call plug#end()

colorscheme interrobang
let g:deoplete#enable_at_startup = 1
let g:kitty_navigator_listening_on_address = 'unix:/tmp/kitty'

if !exists('g:context_filetype#filetypes')
  let g:context_filetype#filetypes = {}
endif
let g:context_filetype#filetypes["javascript.jsx"] =
      \ [{'filetype' : 'css', 'start' : '\D*\`', 'end' : '`'}]
