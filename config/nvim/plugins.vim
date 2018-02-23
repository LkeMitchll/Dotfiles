call plug#begin('~/.local/share/nvim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim', {'on': ['Files', 'Ag', 'Buffers']}
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner', {'on': 'VtrAttachToPane'}
Plug 'joereynolds/vim-minisnip'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'justinmk/vim-sneak'
Plug 'lambdalisue/gina.vim', {'on': 'Gina'}
Plug 'lkemitchll/vim-interrobang'
Plug 'mattn/emmet-vim', {'for': ['html', 'eruby', 'jsx', 'css', 'scss']}
Plug 'roman/golden-ratio'
Plug 'roxma/nvim-completion-manager' | Plug 'fgrsnau/ncm-otherbuf' | Plug 'lkemitchll/ncm-minisnip'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()

colorscheme interrobang
