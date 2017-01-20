" ==============================
" Plugins
" ==============================

" Airline
let g:airline_theme="gruvbox"
let g:airline_left_sep = ""
let g:airline_right_sep = ""

let g:airline#extensions#tabline#enabled = 1

let g:airline_section_b = ""
let g:airline_section_y = ""
let g:airline_section_z = "%{line('.')}/%{line('$')} %{ALEGetStatusLine()}"

" Indentline
let g:indentLine_char = "┆"

" Startify
let g:startify_custom_header = [
      \ '    /$$    /$$       /$$$$$$       /$$      /$$',
      \ '   | $$   | $$      |_  $$_/      | $$$    /$$$',
      \ '   | $$   | $$        | $$        | $$$$  /$$$$',
      \ '   |  $$ / $$/        | $$        | $$ $$/$$ $$',
      \ '    \  $$ $$/         | $$        | $$  $$$| $$',
      \ '     \  $$$/          | $$        | $$\  $ | $$',
      \ '      \  $/          /$$$$$$      | $$ \/  | $$',
      \ '       \_/          |______/      |__/     |__/',
      \ ]
let g:startify_list_order = ["sessions", "files", "dir"]

" CTRLP
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = "ra"
let g:ctrlp_custom_ignore = {
  \ "dir":  "\v[\/]\.(git|hg|svn|sass-cache)$",
  \ "file": "\v\.(exe|so|dll)$",
  \ }

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Fugitive (Git)
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gco :Gcommit<CR>

" GitGutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = 'x'
let g:gitgutter_sign_modified_removed = 'x'

" Ale
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" VimCompletesMe
let g:vcm_direction = 'p'

" VTR (Vim Tmux Runner)
let g:VtrUseVtrMaps = 1
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
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --silent

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif
