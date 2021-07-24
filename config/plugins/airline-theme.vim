"--------------------------------------------------------------
" vim-airline
" 狀態列： Airline & AirlineTheme

let g:airline_theme='papercolor'
" let g:airline_theme='powerlineish'
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'


" 圖示 DevIcons
"
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols_branch = ''
let g:airline_symbols_readonly = '🔒'
let g:airline_symbols_crypt = '🔒'
let g:airline_symbols_linenr = '¶'
let g:airline_symbols_dirty= '⚡'

" adding the custom source to unite
let g:webdevicons_enable_unite = 1

" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'default'

" Virtual Env
let g:airline#extension#virtualenv#enabled = 1
let g:airline#extension#poetv#enabled = 1

let g:airline_powerline_fonts = 1

