call plug#begin('~/.local/share/nvim/plugged')
Plug 'honza/vim-snippets'
Plug 'justinmk/vim-sneak'
Plug 'knubie/vim-kitty-navigator'
Plug 'lambdalisue/gina.vim'
Plug 'matze/vim-move'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'roman/golden-ratio'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug '~/Git/vim-interrobang'
Plug '~/Git/vim-kitchen-sink'
Plug '~/Git/vim-kitty-runner'
call plug#end()

colorscheme interrobang

let g:kitty_navigator_listening_on_address = 'unix:/tmp/kitty'
