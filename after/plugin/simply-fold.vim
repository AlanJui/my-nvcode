"--------------------------------------------------------------
" 程式碼開展與折疊操作：SimplyFold
" - zo： Open fold in current cursor postion
" - zO： Open fold and sub-fold in current cursor postion recursively
" - zc： Close the fold in current cursor position
" - zC： Close the fold and sub-fold in current cursor position recursively

" Set the default to unfolded when a file is opened
set foldmethod=indent
set foldlevel=99

" autocmd BufRead * normal zR

" autocmd BufWinLeave * mkview
" autocmd BufWinEnter * silent loadview

" Preview docstring in fold textd
let g:SimpylFold_docstring_preview = 0

" Fold docstrings   1
let g:SimpylFold_fold_docstring = 0

" Fold docstrings (buffer local)    1
let b:SimpylFold_fold_docstring = 0

" Fold imports  1
let g:SimpylFold_fold_import = 0

" Fold imports (buffer local)   1
let b:SimpylFold_fold_import = 0

" " 拆疊／展開開關
" nmap <Space> za
"
" " Ref: https://vim.fandom.com/wiki/Folding  [Mappings to toggle folds]
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf



"--------------------------------------------------------------
" Ref: http://yyq123.blogspot.com/2011/09/vim-fold.html
" :help fold-commands
" :help fold-manual
" zf11j
" zfa{
" zfa[
set foldmethod=manual
