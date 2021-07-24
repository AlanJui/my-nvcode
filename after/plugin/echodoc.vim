"============================================================
" echodoc.vim: https://github.com/Shougo/echodoc.vim?hmsr=joyk.com&utm_source=joyk.com&utm_medium=referral 
" Displays function signatures from completions in the command line.

" "------------------------------------------------------------
" " Option 1:
" " To use echodoc, you must increase 'cmdheight' value.
" set cmdheight=2
" let g:echodoc_enable_at_startup = 1


"------------------------------------------------------------
" Option 5:
" Or, you could use vim's popup window feature.
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'
" To use a custom highlight for the popup window,
" change Pmenu to your highlight group
highlight link EchoDocPopup Pmenu


