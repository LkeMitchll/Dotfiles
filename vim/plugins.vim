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
let g:airline_section_z = "%{airline#extensions#obsession#get_status()}┆ %{line('.')}/%{line('$')}"

" | Indentline |
let g:indentLine_color_term = 8
let g:indentLine_char = "┆"

" | YankRing |
let g:yankring_replace_n_pkey = '<C-Y>'
let g:yankring_history_dir = '~/.vim'

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

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
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

" | NeoSnippet | "
let g:neosnippet#snippets_directory='~/.vim/snippets'

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
nnoremap <silent> <leader>gc :Gcommit<CR>
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

" | Vimux |
map <Leader>tr :VimuxPromptCommand<CR>
map <Leader>tc :VimuxCloseRunner<CR>
map <Leader>ti :VimuxInspectRunner<CR>
map <Leader>tl :VimuxRunLastCommand<CR>

" | Emmet |
let g:user_emmet_mode='a'

" | Rails |
let g:rails_projections = { 'app/decorators/*.rb': { 'command': 'decorator' }}

" | Ctags |
set tags=./tags

" | Surround |
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"

" | YankRing |
nnoremap <Leader>yr :YRShow<CR>

" | Golden ratio |
let g:golden_ratio_exclude_nonmodifiable = 1
