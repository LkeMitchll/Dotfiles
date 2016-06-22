" | Cheatsheet |
let g:cheatsheet_dir = "~/.vim/"
let g:cheatsheet_ext = "~/.vim/cheatsheet.txt"

command! -nargs=? -complete=customlist,CheatSheetComplete CS call ToggleCheatSheet(<f-args>)
nmap <F6> :CS<CR>

" strip extension from complete list
function! CheatSheetComplete(A)
  return map(split(globpath(g:cheatsheet_dir, a:A.'*'.g:cheatsheet_ext)),
    \ "v:val[".strlen(expand(g:cheatsheet_dir)).
    \ ":-".(strlen(g:cheatsheet_ext) + 1)."]")
endfun

" specify cheatsheet or use filetype of open buffer as default
" instead of saving window status in a boolean variable,
" test if the file is open (by name). If a boolean is used,
" you'll run into trouble if you close the window manually with :wq etc
function! ToggleCheatSheet(...)
  let s:file = g:cheatsheet_ext
  if bufwinnr(s:file) != -1
    call ToggleWindowClose(s:file)
  else
    call ToggleWindowOpen(s:file)
  endif
endfun

" stateless open and close so it can be used with other plugins
function! ToggleWindowOpen(file)
  let splitr = &splitright
  set splitright
  exe ":vsp ".a:file
  exe ":vertical resize 84"
  if !splitr
    set splitright
  endif
endfun

function! ToggleWindowClose(file)
  let w_orig = bufwinnr('%')
  let w = bufwinnr(a:file)
  exe w.'wincmd w'
  exe ':silent wq!'
  if w != w_orig
    exe w_orig.'wincmd w'
  endif
endfun
" END CHEATSHEET
