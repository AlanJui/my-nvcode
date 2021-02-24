"--------------------------------------------------------------
" coc-explorer
nmap <space>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }


" " Use preset argument to open it
" nmap <space>ed :CocCommand explorer --preset .vim<CR>
" nmap <space>ef :CocCommand explorer --preset floating<CR>
" nmap <space>ec :CocCommand explorer --preset cocConfig<CR>
" nmap <space>eb :CocCommand explorer --preset buffer<CR>
"
" " List all presets
" nmap <space>el :CocList explPresets
"
"
" function! s:explorer_cur_dir()
"   let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
"   return fnamemodify(node_info['fullpath'], ':h')
" endfunction
"
" function! s:exec_cur_dir(cmd)
"   let dir = s:explorer_cur_dir()
"   execute 'cd ' . dir
"   execute a:cmd
" endfunction
"
" function! s:init_explorer()
"   set winblend=10
"
"   " Integration with other plugins
"
"   " CocList
"   nmap <buffer> <Leader>fg :call <SID>exec_cur_dir('CocList -I grep')<CR>
"   nmap <buffer> <Leader>fG :call <SID>exec_cur_dir('CocList -I grep -regex')<CR>
"   nmap <buffer> <C-p> :call <SID>exec_cur_dir('CocList files')<CR>
"
"   " vim-floaterm
"   nmap <buffer> <Leader>ft :call <SID>exec_cur_dir('FloatermNew --wintype=floating')<CR>
" endfunction
"
" function! s:enter_explorer()
"   if &filetype == 'coc-explorer'
"     " statusline
"     setl statusline=coc-explorer
"   endif
" endfunction
"
" augroup CocExplorerCustom
"   autocmd!
"   autocmd BufEnter * call <SID>enter_explorer()
"   autocmd FileType coc-explorer call <SID>init_explorer()
" augroup END
