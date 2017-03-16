if &compatible
  set nocompatible
end
set runtimepath+=/Users/Luke/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/Luke/.local/share/dein')

call dein#begin('/Users/Luke/.local/share/dein')
call dein#add('/Users/Luke/.local/share/dein/repos/github.com/Shougo/dein.vim')

" Dein utility commands
call dein#add('haya14busa/dein-command.vim')
" Colorscheme
call dein#add('noahfrederick/vim-noctu')
" File and buffer finder
call dein#add('/usr/local/opt/fzf')
call dein#add('junegunn/fzf.vim',
      \{ 'depends': 'fzf' })
" Syntax errors inline
call dein#add('w0rp/ale')
" Easily change brackets etc.
call dein#add('tpope/vim-surround')
" Navigate tmux panes and vim splits smoothly
call dein#add('christoomey/vim-tmux-navigator')
" Automatic session saving
call dein#add('tpope/vim-obsession')
call dein#add('dhruvasagar/vim-prosession')
" Automatically make current split bigger
call dein#add('roman/golden-ratio')
" Medium movements with three keystrokes
call dein#add('justinmk/vim-sneak')
" Tab auto-complete
call dein#add('Shougo/deoplete.nvim')
" Multi-file search
call dein#add('wincent/ferret',
      \{'on_map': '<Plug>(FerretAck)'})
" Git integration
call dein#add('tpope/vim-fugitive',
      \{'on_cmd' : 'Gstatus'})
" Short syntax and expansion for HTML markup
call dein#add('mattn/emmet-vim',
      \{ 'on_ft': ['html', 'scss'] })
" Open TMUX splits to run commands
call dein#add('christoomey/vim-tmux-runner',
      \{ 'on_cmd': 'VtrAttachToPane' })
" Line commenting
call dein#add('tpope/vim-commentary',
      \{ 'on_map': '<Plug>CommentaryLine' })
" Display git diffs in gutter
call dein#add('mhinz/vim-signify',
      \{'on_event': 'BufWrite'})
" Preview markdown files in Markoff
call dein#add('aliou/markoff.vim',
      \{'on_cmd': 'Markoff'})
" Rails IDE
call dein#add('tpope/vim-rails')

" Syntaxes
call dein#add('hail2u/vim-css3-syntax',
      \{ 'on_ft': 'scss' })
call dein#add('mxw/vim-jsx',
      \{ 'on_ft': 'javascript'})
call dein#add('pangloss/vim-javascript',
      \{ 'on_ft': 'javascript' })
call dein#add('tpope/vim-markdown',
      \{ 'on_ft': 'markdown' })
call dein#add('tmux-plugins/vim-tmux',
      \{ 'on_ft': 'tmux' })

call dein#end()
call dein#save_state()

endif

filetype plugin indent on
syntax enable
