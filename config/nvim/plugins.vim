call plug#begin('~/.local/share/nvim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim', {'on': ['Files', 'Ag', 'Buffers']}
Plug 'joereynolds/vim-minisnip'
Plug 'justinmk/vim-sneak'
Plug 'lambdalisue/gina.vim', {'on': 'Gina'}
Plug 'mattn/emmet-vim', {'for': ['html', 'eruby', 'jsx', 'css', 'scss']}
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim' | Plug  '~/Git/deoplete-minisnip'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug '~/Git/vim-interrobang'
Plug '~/Git/vim-kitty-runner'
call plug#end()

colorscheme interrobang
let g:deoplete#enable_at_startup = 1
