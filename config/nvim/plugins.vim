" ==============================
" Plugins
" ==============================

" Init Dein
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

" FZF
call dein#add('junegunn/fzf',
      \{ 'build': './install', 'rtp': '' })
call dein#add('junegunn/fzf.vim',
      \{ 'depends': 'fzf' })
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down': '~30%' }

function! s:fzf_statusline()
  setlocal statusline=%#fzf1#\ fzf
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <C-T> :ProjectFiles<CR>
nnoremap <Leader>bu :Buffers<CR>
nnoremap <Leader>bl :BLines<CR>
nnoremap <Leader>; :Commands<CR>
nnoremap <Leader>' :Marks<CR>

" Fugitive
call dein#add('tpope/vim-fugitive',
      \{'on_cmd' : 'Gstatus'})
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gco :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>

" Signify
call dein#add('mhinz/vim-signify',
      \{'on_event': 'BufWrite'})
let g:signify_sign_show_count = 0

" Ale
call dein#add('w0rp/ale')
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
set statusline+=\ %1*%{ALEGetStatusLine()}\ 
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_column_always = 1

" Deocomplete
"
call dein#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let deoplete#tag#cache_limit_size = 5000000
call dein#add('carlitux/deoplete-ternjs',
      \{ 'build': 'yarn global add tern' })
let g:tern#filetypes = [
    \ 'jsx',
    \ 'javascript.jsx'
    \ ]
call dein#add('fishbullet/deoplete-ruby')

" VTR (Vim Tmux Runner)
call dein#add('christoomey/vim-tmux-runner',
      \{ 'on_cmd': 'VtrAttachToPane' })
let g:VtrClearSequence = ""
map <Leader>ta :VtrAttachToPane<CR>1<CR>
map <Leader>tr :VtrFlushCommand<cr>:VtrSendCommandToRunner<cr>
map <Leader>tl :VtrSendCommandToRunner<cr>
map <Leader>tc :VtrClearRunner<cr>

" Surround
call dein#add('tpope/vim-surround')
let b:surround_{char2nr("=")} = "<%= \r %>"
let b:surround_{char2nr("-")} = "<% \r %>"

" Commentary
call dein#add('tpope/vim-commentary',
      \{ 'on_map': '<Plug>CommentaryLine' })
nmap gcc <Plug>CommentaryLine

" Ferret
call dein#add('wincent/ferret',
      \{'on_map': '<Plug>(FerretAck)'})
nmap <Leader>a <Plug>(FerretAck)

" Obsession/Prosession
call dein#add('tpope/vim-obsession')
call dein#add('dhruvasagar/vim-prosession')
let g:prosession_dir = '~/.config/nvim/sessions'

" Vim Tmux Navigation
call dein#add('christoomey/vim-tmux-navigator')
" Split auto-sizing
call dein#add('roman/golden-ratio')
" Fast medium movements
call dein#add('justinmk/vim-sneak')
" Fast HTML expansion expressions
call dein#add('mattn/emmet-vim',
      \{ 'on_ft': ['html', 'scss'] })
" Extra Rails functionality
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
