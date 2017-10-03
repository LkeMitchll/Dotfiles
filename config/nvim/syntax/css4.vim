" Vim syntax file
" Language:     CSS4

if !exists("main_syntax")
  let main_syntax = "css4"
endif

if exists("b:current_syntax") && b:current_syntax == "css4"
  finish
endif

" Inherit CSS3 syntax
runtime! syntax/css.vim
runtime! syntax/css/*.vim

" Root selector
syn region css4RootDefinition matchgroup=cssBraces start=':root {' end='}' contains=cssString.*,cssInclude,cssFontDescriptor,@comment,css4Variable,css containedin=cssMediaBlock fold

" Variables
syn match css4Variable "--[[:alnum:]_-]\+" containedin=cssFunction,cssInclude,cssMediaBlock,cssMediaType,css4RootDefinition nextgroup=css4VariableAssignment skipwhite
syn match css4VariableAssignment ":" contained nextgroup=css4VariableValue skipwhite
syn region css4VariableValue start="" end="\ze[;)]" contained contains=css.*Attr,cssValue.*,cssColor,cssFunction,cssString.*,cssURL,css4Variable,@comment

hi def link css4Variable Identifier

let b:current_syntax = "css4"
