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
let g:airline_section_z = "%{line('.')}/%{line('$')}"

" Indentline
let g:indentLine_char = "┆"

" Startify
let g:startify_custom_header = []
let g:startify_list_order = ["files", "dir", "sessions", "bookmarks", "commands"]

" NeoComplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = "\*ku\*"

if !exists("g:neocomplete#keyword_patterns")
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns["default"] = "\h\w*"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists("g:neocomplete#sources#omni#input_patterns")
  let g:neocomplete#sources#omni#input_patterns = {}
endif

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

" Syntastic
"let g:syntastic_debug = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_scss_checkers = ["scss_lint", "sass"]
let g:syntastic_scss_scss_lint_args="--config ~/.scss-lint.yml"
let g:syntastic_haml_checkers = ["haml_lint", "haml"]
let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_javascript_checkers = ["eslint"]

" VTR (Vim Tmux Runner)
let g:VtrUseVtrMaps = 1
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
