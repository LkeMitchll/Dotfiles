if &compatible
  set nocompatible
end
set runtimepath+=/Users/Luke/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/Luke/.local/share/dein')
  call dein#begin('/Users/Luke/.local/share/dein')
  call dein#add('/Users/Luke/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Colorscheme
  call dein#add('noahfrederick/vim-noctu')

  " File and buffer finder
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim')
  " Syntax errors inline
  call dein#add('w0rp/ale')
  " Rails IDE
  call dein#add('tpope/vim-rails')
  " Easily change brackets etc.
  call dein#add('tpope/vim-surround')
  " Pretty indentation lines
  call dein#add('Yggdroot/indentLine')
  " Navigate tmux panes and vim splits smoothly
  call dein#add('christoomey/vim-tmux-navigator')
  " Automatic session saving
  call dein#add('tpope/vim-obsession')
  call dein#add('dhruvasagar/vim-prosession')
  " Automatically make current split bigger
  call dein#add('roman/golden-ratio')

  " Syntaxes
  call dein#add('hail2u/vim-css3-syntax',
        \{ 'on_ft': 'scss' })
  call dein#add('mxw/vim-jsx',
        \{ 'on_ft': 'javascript.jsx' })
  call dein#add('pangloss/vim-javascript',
        \{ 'on_ft': 'javascript' })
  call dein#add('tpope/vim-markdown',
        \{ 'on_ft': 'markdown' })
  call dein#add('tmux-plugins/vim-tmux',
        \{ 'on_ft': 'tmux' })
  " Tab auto-complete
  call dein#add('Shougo/deoplete.nvim',
        \{'on_event': 'InsertEnter'})
  " Multi-file search
  call dein#add('wincent/ferret',
        \{'on_map': '<Plug>(FerretAck)'})
  " Git integration
  call dein#add('tpope/vim-fugitive',
        \{'on_cmd' : 'Gstatus'})
  " Short sytnax and expansion for HTML markup
  call dein#add('mattn/emmet-vim',
        \{ 'on_ft': ['html', 'scss'] })
  " Open TMUX splits to run commands
  call dein#add('christoomey/vim-tmux-runner',
        \{ 'on_cmd': 'VtrAttachToPane' })
  " Useful vim startup screen
  call dein#add('mhinz/vim-startify',
        \{ 'on_cmd': 'Startify' })
  " Medium movements with three keystrokes
  call dein#add('justinmk/vim-sneak',
        \{ 'on_map': '<Plug>SneakLabel_s' })
  " Line commenting
  call dein#add('tpope/vim-commentary',
        \{ 'on_map': '<Plug>CommentaryLine' })
  " Display git diffs in gutter
  call dein#add('airblade/vim-gitgutter',
        \{'on_event': 'BufWrite'})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
