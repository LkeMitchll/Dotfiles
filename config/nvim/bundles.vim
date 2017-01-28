if &compatible
  set nocompatible
end

call plug#begin('~/.local/share/nvim/plugged')

" Colorscheme
Plug 'noahfrederick/vim-noctu'
" Syntaxes
Plug 'hail2u/vim-css3-syntax', { 'for': 'scss' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
" File and buffer finder
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Syntax errors inline
Plug 'w0rp/ale'
" Tab auto-complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Multi-file search
Plug 'wincent/ferret', { 'on': '<Plug>(FerretAck)' }
" Git integration
Plug 'tpope/vim-fugitive'
" Rails IDE
Plug 'tpope/vim-rails'
" Easily change brackets etc.
Plug 'tpope/vim-surround'
" Short sytnax and expansion for HTML markup
Plug 'mattn/emmet-vim', { 'for': ['html', 'scss'] }
" Pretty indentation lines
Plug 'Yggdroot/indentLine'
" Open TMUX splits to run commands
Plug 'christoomey/vim-tmux-runner', { 'on': 'VtrAttachToPane' }
" Navigate tmux panes and vim splits smoothly
Plug 'christoomey/vim-tmux-navigator'
" Display git diffs in gutter
Plug 'airblade/vim-gitgutter'
" Useful vim startup screen
Plug 'mhinz/vim-startify', { 'on': 'Startify' }
" Automatic session saving
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
" Medium movements with three keystrokes
Plug 'justinmk/vim-sneak', { 'on': '<Plug>SneakLabel_s' }
" Automatically make current split bigger
Plug 'roman/golden-ratio'
" Line commenting
Plug 'tpope/vim-commentary', { 'on': '<Plug>CommentaryLine' }

call plug#end()
