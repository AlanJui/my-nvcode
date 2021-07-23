
let g:black#settings = {
\   'fast': 1,
\   'line_length': 100
\}

nnoremap <buffer><silent> <Leader>cf <cmd>call Black()<cr>
inoremap <buffer><silent> <Leader>cf <cmd>call Black()<cr>

" au BufWrite *.py <cmd>call Black()<cr>
au FileType python BufWrite <cmd>call Black()<cr>
