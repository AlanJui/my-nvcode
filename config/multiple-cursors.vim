"------------------------------------------------------------
" 多重游標操作
" Multiple cursors support 
" URL: https://github.com/neoclide/coc.nvim/wiki/Multiple-cursors-support

" hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

" Start multiple cursors session
" more vscode like behavior
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc


