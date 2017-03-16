" ==============================
" Plugins
" ==============================

" FZF
let g:fzf_layout = { 'down': '~30%' }
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <C-T> :ProjectFiles<CR>
nnoremap <Leader>bu :Buffers<CR>
nnoremap <Leader>bl :BLines<CR>
nnoremap <Leader>; :Commands<CR>
nnoremap <Leader>' :Marks<CR>

" Fugitive (Git)
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gco :Gcommit<CR>

" GitGutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = 'x'
let g:gitgutter_sign_modified_removed = 'x'

" Ale
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
set statusline+=\ %1*%{ALEGetStatusLine()}\ 
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_column_always = 1

" Deocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let deoplete#tag#cache_limit_size = 5000000

" VTR (Vim Tmux Runner)
let g:VtrClearSequence = ""
map <Leader>ta :VtrAttachToPane<CR>1<CR>
map <Leader>tr :VtrFlushCommand<cr>:VtrSendCommandToRunner<cr>
map <Leader>tl :VtrSendCommandToRunner<cr>
map <Leader>tc :VtrClearRunner<cr>

" Rails
let g:rails_projections = { "app/decorators/*.rb": { "command": "decorator" }}

" Surround
let b:surround_{char2nr("=")} = "<%= \r %>"
let b:surround_{char2nr("-")} = "<% \r %>"

" Silver Searcher
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --silent
endif

" Commentary
nmap gcc <Plug>CommentaryLine

" Ferret
nmap <Leader>a <Plug>(FerretAck)

" Prosession
let g:prosession_dir = '~/.config/nvim/sessions'
