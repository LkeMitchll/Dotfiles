call plug#begin('~/.local/share/nvim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim', {'on': ['Files', 'Ag', 'Buffers']}
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner', {'on': 'VtrAttachToPane'}
Plug 'joereynolds/vim-minisnip'
Plug 'justinmk/vim-sneak'
Plug 'lambdalisue/gina.vim', {'on': 'Gina'}
Plug 'mattn/emmet-vim', {'for': ['html', 'eruby', 'jsx', 'css', 'scss']}
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'Shougo/deoplete.nvim' | Plug  '~/Git/deoplete-minisnip'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug '~/Git/vim-interrobang'
call plug#end()

colorscheme interrobang
let g:deoplete#enable_at_startup = 1
