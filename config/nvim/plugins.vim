" Init Dein
if &compatible
  set nocompatible
end
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('~/Git/vim-interrobang')
  call dein#add('christoomey/vim-tmux-runner')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('dhruvasagar/vim-prosession')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('/usr/local/bin/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('junegunn/vim-peekaboo')
  call dein#add('justinmk/vim-sneak')
  call dein#add('mattn/emmet-vim', { 'on_ft': ['html'] })
  call dein#add('mhinz/vim-signify')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-obsession')
  call dein#add('roman/golden-ratio')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('w0rp/ale')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

colorscheme interrobang

" FZF
set rtp+=/usr/local/opt/fzf

""" Customize the statusline
function! s:fzf_statusline()
  setlocal statusline=%#fzf1#\ fzf
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

""" Browse files in current git dir
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
""" Ctrl-T like functionality
nnoremap <C-T> :ProjectFiles<CR>
""" Custom ripgrep command
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
""" Ferret like grepping functionality
nmap <Leader>a :Find<Space>
""" Search buffers
nnoremap <Leader>bu :Buffers<CR>

" Fugitive
map <leader>gs :Gstatus<CR>
map <leader>gco :Gcommit<CR>

" Signify
let g:signify_sign_show_count = 0

" Ale
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_sign_column_always = 1
set statusline+=\ %1*%{ALEGetStatusLine()}\ 
let g:ale_javascript_eslint_use_global = 1
let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }
map <Leader>f :ALEFix<CR>

" Deocomplete
let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 5000000
let g:tern#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx'
      \ ]

" VTR (Vim Tmux Runner)
let g:VtrClearSequence = ""
map <Leader>ta :VtrAttachToPane<CR>1<CR>
map <Leader>tr :VtrFlushCommand<cr>:VtrSendCommandToRunner<cr>
map <Leader>tl :VtrSendCommandToRunner<cr>
map <Leader>tc :VtrClearRunner<cr>

" Surround
let g:surround_45 = "<% \r %>" " on hyphen
let g:surround_61 = "<%= \r %>" " on equals

" Prosession
let g:prosession_dir = '~/.config/nvim/sessions'
let g:prosession_on_startup = 1

" Syntaxes
let g:html_indent_tags = 'li\|p\|span'
let g:jsx_ext_required = 0
