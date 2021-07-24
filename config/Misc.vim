"=================================================================== "
" 其它設定
"=================================================================== "


" 設定 <Leader> 鍵
let mapleader = ","


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 軟體開發輔助工具：ipdb 除錯器
" Ref URL: https://gist.github.com/berinhard/523420/89ce9864ce60b9053b31c8a26a20ae0355892f3b
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! s:setbreakpoint()
    cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:removebreakpoint()
    exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:togglebreakpoint()
    if getline('.')=~#'^\s*import\sipdb' | cal s:removebreakpoint() | el | cal s:setbreakpoint() | en
endf

nnoremap <f9> :call <sid>togglebreakpoint()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 客製用 Vim Scripts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" " Dracula Mode (Dark)
" function! ColorDracula()
"     color dracula
"     let g:airline_theme=''
"     IndentLinesEnable
" endfunction
"
"
" " Forgotten Mode (Light)
" function! ColorForgotten()
"     " Light airline themes: tomorrow, silver, alduin
"     " Light colors: forgotten-light, nemo-light
"     let g:airline_theme='tomrrow'
"     color forgotten-light
"     IndentLinesDisable
" endfunction
"
"
" " Zazen Mode (Black & White)
" function! ColorZazen()
"     let g:airline_theme='badcat'
"     color zazen
"     IndentLinesEnable
" endfunction
"
"
" function TextwidthIsTooWide()
"   if &l:textwidth ># 80
"       return 1
"   endif
" endfunction
"
"--------------------------------------------------------------
