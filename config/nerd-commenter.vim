"--------------------------------------------------------------
" 註解標示：scrooloose/nerdcommenter
"
" (1) Comment out the current line or text selected in visual mode.
"     : [count]<Leader>cc
"nmap <Leader>cc :NERDCommenterComment<CR>

" (2) Uncomments the selected line(s). ==> [count]<Leader>cu
"nmap <Leader>cu :NERDCommenterUncomment<CR>

" nerdcommenter: Comment code
" https://vimawesome.com/plugin/nerdcommenter-may-fear-less
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" nmap <C-/> <plug>NERDCommenterToggle
" vmap <C-/> <plug>NERDCommenterToggle

nmap <C-\/> :NERDComToggleComment<CR>
vmap <C-\/> :NERDComToggleComment<CR>

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

