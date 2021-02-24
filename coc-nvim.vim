
"==============================================================

" 設定 <Leader> 鍵
let mapleader = ","


" coc extensions
let g:coc_global_extensions = [
\ 'coc-explorer',
\ 'coc-syntax',
\ 'coc-prettier',
\ 'coc-snippets',
\ 'coc-tsserver',
\ 'coc-tslint-plugin',
\ 'coc-highlight',
\ 'coc-emmet',
\ 'coc-smartf',
\ 'coc-git',
\ 'coc-css',
\ 'coc-html',
\ 'coc-docker',
\ 'coc-yaml',
\ 'coc-sh',
\ 'coc-json',
\ 'coc-xml',
\ 'coc-yank',
\ 'coc-pyright',
\ ]
" \ 'coc-python',


"--------------------------------------------------------------
" List all "Lint Messages"
nmap <Leader>ll :CocList diagnostics<Enter>

"--------------------------------------------------------------
" coc-vim 自動完成輸入設定

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"----------------------------------------------------------------------
" coc-snippets
" To make completion works like VSCode
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'


" "--------------------------------------------------------------
" " coc-emmet
" " " Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
"
" " 令 coc-emmet 可支援 Django （FileType: htmldjango)
" let g:coc_filetype_map = {
"       \ 'htmldjango': 'html',
"       \ 'wxss': 'css',
"       \ }
"
" " inoremap <silent><expr> <TAB>
" "       \ pumvisible() ? coc#_select_confirm() :
" "       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
" "       \ <SID>check_back_space() ? "\<TAB>" :
" "       \ coc#refresh()
" "
" " function! s:check_back_space() abort
" "   let col = col('.') - 1
" "   return !col || getline('.')[col - 1]  =~# '\s'
" " endfunction
" "
" " let g:coc_snippet_next = '<tab>'

"--------------------------------------------------------------
" 佈景、配色與字體

autocmd CursorHold * silent call CocActionAsync('highlight')


" "--------------------------------------------------------------
" " coc-nvim integration with vim-airline
"
" " enable/disable coc integration
" let g:airline#extensions#coc#enabled = 1
"
" " change error symbol:
" let airline#extensions#coc#error_symbol = 'E:'
"
" " change warning symbol:
" let airline#extensions#coc#warning_symbol = 'W:'
"
" " change error format:
" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
"
" " change warning format:
" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'


" "--------------------------------------------------------------
" " coc-pairs
" autocmd FileType html let b:coc_pairs = [["{#", "#}"]]
" autocmd FileType htmldjango let b:coc_pairs = [ ["#", "#"], ["%", "%"] ]
" autocmd FileType tex let b:coc_pairs = [["$", "$"]]
"
" " Disable ` character in Markdown filetype
" autocmd FileType markdown let b:coc_pairs_disabled = ['`']

""----------------------------------------------------------------------
"" coc-git
"" lightline
"let g:lightline = {
"  \ 'active': {
"  \   'left': [
"  \     [ 'mode', 'paste' ],
"  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
"  \   ],
"  \   'right':[
"  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
"  \     [ 'blame' ]
"  \   ],
"  \ },
"  \ 'component_function': {
"  \   'blame': 'LightlineGitBlame',
"  \ }
"\ }
"
"function! LightlineGitBlame() abort
"  let blame = get(b:, 'coc_git_blame', '')
"  " return blame
"  return winwidth(0) > 120 ? blame : ''
"endfunction
"
"set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
"
""----------------------------------------------------------------------
"" coc-nvim 操作設定
"
"
"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"
"" Remap for rename current word
"nmap <Leader>rn <Plug>(coc-rename)
"
"
"" Remap for format selected region
"xmap <Leader>f  <Plug>(coc-format-selected)
"nmap <Leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"
"" Remap for do codeAction of selected region, ex: `<Leader>aap` for current paragraph
"xmap <Leader>a  <Plug>(coc-codeaction-selected)
"nmap <Leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <Leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <Leader>qf  <Plug>(coc-fix-current)
"
"
"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"
"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"
"""" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
"
"""" Using the configuration file
"function! SetupCommandAbbrs(from, to)
"  exec 'cnoreabbrev <expr> '.a:from
"        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
"        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
"endfunction
"
"" Use C to open coc config
"call SetupCommandAbbrs('C', 'CocConfig')
"
"autocmd FileType json syntax match Comment +\/\/.\+$+
"
