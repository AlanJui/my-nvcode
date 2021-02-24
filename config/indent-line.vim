"--------------------------------------------------------------
" indentLine

let g:indentLine_enabled = 0
let g:indentLine_showFirstIndentLevel = 1

" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}


" We need to define them here to avoid issues when running in the terminal
" if g:colors_name ==# 'heraldish'
"     let g:indentLine_color_gui = '#666462' " mediumgravel
"     let g:indentLine_color_term = 241
" elseif g:colors_name ==# 'onedarkish'
"     let g:indentLine_color_gui = '#5c6370' " comment_grey
"     let g:indentLine_color_term = 59
" endif

" nnoremap <silent> <leader>M :IndentLinesToggle<cr>
nnoremap <silent> si :IndentLinesToggle<cr>


