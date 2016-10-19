" ===============================
" Plugins
" ===============================

" | Airline |
let g:airline_theme='gruvbox'

let g:airline#extensions#tabline#enabled = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#obsession#indicator_text = '✓'

let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = "%{airline#extensions#obsession#get_status()}|| %{line('.')}/%{line('$')}"

" | Indentline |
let g:indentLine_color_term = 8
let g:indentLine_char = "┆"

" | Startify |
let g:startify_custom_header = []
let g:startify_list_order = ['files', 'dir', 'sessions', 'bookmarks', 'commands']
let g:startify_bookmarks = [ '~/.vimrc.local', '~/.zshrc' ]

" | NeoComplete |"
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

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
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" | CTRLP |
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" | Fugitive (Git) |
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gco :Gcommit<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" | Syntastic |
"let g:syntastic_debug = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_scss_checkers = ['scss_lint', 'sass']
let g:syntastic_scss_scss_lint_args="--config ~/.scss-lint.yml"
let g:syntastic_haml_checkers = ['haml_lint', 'haml']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']

" | VTR (Vim Tmux Runner) |
let g:VtrUseVtrMaps = 1
map <Leader>ta :VtrAttachToPane<CR>1<CR>
map <Leader>tr :VtrFlushCommand<cr>:VtrSendCommandToRunner<cr>
map <Leader>tl :VtrSendCommandToRunner<cr>
map <Leader>tc :VtrClearRunner<cr>

" | Emmet |
let g:user_emmet_mode='a'

" | Rails |
let g:rails_projections = { 'app/decorators/*.rb': { 'command': 'decorator' }}

" | Ctags |
set tags=./tags

" | Surround |
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"
