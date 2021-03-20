" 設定 <Leader> 鍵
let g:mapleader = ","
let mapleader = ","


"==============================================================
" 擴充套件設定
"==============================================================


" === Ultisnips.vim ===
" let g:UltiSnipsExpandTrigger       = "<c-j>"
" let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
" let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" coc-snippets , coc-ultisnips, honza/vim-snippets
" :CocList snippets

" === 1 ===

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ==== 2 ===

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)    "List possible snippets based on current file

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" === 3 ===

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'




" " Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.

" 令 coc-emmet 可支援 Django （FileType: htmldjango)
let g:coc_filetype_map = {
      \ 'htmldjango': 'html',
      \ 'wxss': 'css',
      \ }

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" let g:coc_snippet_next = '<tab>'


" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1


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


"--------------------------------------------------------------
" UML :  :!makeprg %
autocmd FileType plantuml setlocal shiftwidth=2 tabstop=2 softtabstop=2
let g:plantuml_executable_script = 'makeprg'
let g:plantuml_set_makeprg = 1

autocmd FileType plantuml nnoremap <buffer> <Leader>b :!java -jar ~/bin/plantuml.jar -tpng -o %:p:h %<cr>


"--------------------------------------------------------------
" 註解標示：scrooloose/nerdcommenter


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

nmap <C-\/> :NERDComToggleComment<CR>
vmap <C-\/> :NERDComToggleComment<CR>
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" (1) Comment out the current line or text selected in visual mode.
"     : [count]<Leader>cc
"nmap <Leader>cc :NERDCommenterComment<CR>

" (2) Uncomments the selected line(s). ==> [count]<Leader>cu
"nmap <Leader>cu :NERDCommenterUncomment<CR>


"--------------------------------------------------------------
" " 輸入自動配對：jiangmiao/auto-pairs
let g:AutoPairsFlyMode = 1
" let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairs = {
    \'(':')',
    \'[':']',
    \'{':'}',
    \"'":"'",
    \'"':'"',
    \"`":"`",
    \'```':'```',
    \'"""':'"""',
    \"'''":"'''"
    \}
autocmd FileType html  let b:AutoPairs = AutoPairsDefine({'{%' : '%}'})
autocmd FileType htmldjango let b:AutoPairs = AutoPairsDefine({'{%' : '%}'})

"--------------------------------------------------------------
" coc-pairs
" autocmd FileType html let b:coc_pairs = ["{%", "%}"]
" autocmd FileType htmldjango let b:coc_pairs = ["{%", "%}"]

"--------------------------------------------------------------
" 程式碼開展與折疊操作：SimplyFold
"
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



"======================================================================
" 快速鍵設定
"======================================================================

" 跳脫 Visual Mode
vnoremap v <Esc>

" 離開插入模式，回返一般模式
imap jj <Esc>

" 不離開插入模式下，在游標下新插入一行
imap \nn <C-o>o
imap <S-Enter> \nn
imap <C-Enter> \nn

" Insert newline without entering insert mode
" https://vim.fandom.com/wiki/Insert_newline_without_entering_insert_mode
nmap <S-Enter> O<Esc>

" 進入「貼上（Paste）」模式
set pastetoggle=<F2>


" 滑䑕指標可切換 tab
imap <C-,> <Esc>A,<left>
imap <Leader><Leader> <Esc>A,

" Automatically re-read file if a change was detected outside of vim
set autoread

" 關閉目前正編輯的檔案
map <Leader>fc :bd<CR>      " 已存檔
map <Leader>fC :bd!<CR>     " 已編輯，不存檔，強迫關閉


" 儲存檔案
nmap <Leader>w :w<CR>
imap <Leader>w :w<CR>
vmap <Leader>w :w<CR>
nmap <Leader>fs :w<CR>

nmap <C-s> :w<CR>
imap <C-s> :w<CR>
vmap <C-s> :w<CR>


" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %


" 退出 Vim
noremap <Leader>e :quit<CR>  " Exit current window
noremap <Leader>E :qa!<CR>   " Exit all windows
nnoremap <Leader>Q  :qa!<CR>
nmap <C-Q>  :qa!<CR>


" 拆疊／展開開關
nmap <Space> za

" Ref: https://vim.fandom.com/wiki/Folding  [Mappings to toggle folds]
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf


" === Search shorcuts === "
"   <leader>s - Find and replace
"   <leader>S - Claer highlighted search terms while preserving history
map <leader>s :%s///<left><left>

" 清除搜尋完後的醒目提示
nmap <silent> <leader>S :nohlsearch<CR>


"==================================================================
" 檔案作業
"==================================================================


 "--------------------------------------------------------------
" 快速檔案搜尋與切換
" === Denite shorcuts === "
"   sb - Browser currently open buffers
"   sf - Browse list of files in current directory
"   sg - Search current directory for occurences of given term and close window if no results
"   sc - Search current directory for occurences of word under cursor
nmap sb :Denite buffer<CR>
nmap sf :DeniteProjectDir file/rec<CR>
nmap sg :<C-u>Denite grep:. -no-empty<CR>
nmap sc :<C-u>DeniteCursorWord grep:.<CR>
" nmap <C-o> :Denite buffer<CR>


" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-i>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction


"--------------------------------------------------------------
" defx
" pip install pynvim
" pip install Send2Trash
" 

let g:indentLine_fileTypeExclude = ['defx']
let g:indentLine_fileTypeExclude = ['defx'] " defx filetype is defx
let g:indentLine_bufTypeExclude = ['nofile']  " defx buftype is nofile
let g:indentLine_bufNameExclude = ["\[defx\]*"]  " my defx bufname is [defx] -0

map <silent> <C-k><C-b> :Defx<CR>

            " \ 'root_marker': '≡ ',
            " \ 'root_marker': '📁 ',
call defx#custom#option('_', {
            \ 'root_marker': '[Root]: ',
            \ 'toggle': 1,
            \ 'winwidth': 66,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'columns': 'mark:indent:icons:git:filename:time:size',
            \ 'show_ignored_files': 0,
            \ 'ignored_files':
            \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
            \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
            \   . ',.vscode,.idea,.vagrant',
            \ })
call defx#custom#column('mark', {
            \ 'readonly_icon': '',
            \ 'selected_icon': '',
            \ })
call defx#custom#column('indent', { 'indent': '  '})
call defx#custom#column('icon', {
            \ 'root_icon': '',
            \ 'directory_icon': '',
            \ 'opened_icon': '',
            \ })
call defx#custom#column('filename', {
            \ 'min_width': 30,
            \ 'max_width': 60,
            \ })
call defx#custom#column('time', {'format': '%y-%m-%d %H:%M'})

" Shown only current directory in root
function! Root(path) abort
    return fnamemodify(a:path, ':t') . '/'
endfunction
call defx#custom#source('file', {'root': 'Root'})

" Maps
nnoremap <silent> <Leader>fe :Defx<CR>
nnoremap <silent> <Leader>ff :Defx `expand('%:p:h')`
            \ -search=`expand('%:p')`<CR>
nnoremap <silent> <Leader>df :Defx `expand('%:p:h') ` -search=`expand('%:p')`<CR>
            \ :execute 'Defx -new -split=horizontal -direction= '
            \ . b:defx.paths[0]<CR>:wincmd p<CR>
            \ :execute float2nr(&lines /2) . 'wincmd _ '<CR>
nnoremap <silent> <Leader>fb :Defx<CR>:Denite defx/dirmark<CR>
nnoremap <silent> <Leader>fr :Defx -resume<CR>
nnoremap <silent> <Leader>fm :call <SID>TmuxSplitCmd('ranger', '')<CR>

function! s:QuitAllDefx(context) abort
    let buffers = filter(range(1, bufnr('$')),
                \ 'getbufvar(v:val, "&filetype") ==# "defx"')
    let win_id = -1
    for i in buffers
        call defx#call_action('quit')
        if win_id == -1
            let win_id = win_getid()
            wincmd p
        endif
    endfor
    call win_gotoid(win_id)
endfunction

" Filetype settings
augroup ps_defx
    au!
    au FileType defx call s:defx_settings()
    au FileType defx setlocal relativenumber
augroup END


function! s:defx_settings()
    " Exit with escape key and q, Q
    nnoremap <silent><buffer><expr> <ESC> defx#do_action('quit')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> Q defx#do_action('call', '<SID>QuitAllDefx')
    " Edit and open with external program
    nnoremap <silent><buffer><expr> <CR>
        \ defx#is_directory() ? defx#do_action('open') :
        \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> l
        \ defx#is_directory() ? defx#do_action('open') :
        \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> o defx#do_action('execute_system')
   " Tree editing, opening and closing
   nnoremap <silent><buffer><expr> e
        \ defx#is_directory() ? defx#do_action('open_tree') :
        \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> zo defx#do_action('open_tree')
    nnoremap <silent><buffer><expr> zc defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> zr defx#do_action('open_tree_recursive',
                \ [3])
    " Open files in splits
    nnoremap <silent><buffer><expr> s
        \ defx#do_action('multi', [['drop', 'split'], 'quit'])
    nnoremap <silent><buffer><expr> v
        \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
    " Copy, move, paste and remove
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    nnoremap <silent><buffer><expr> d defx#do_action('remove_trash')
    " Yank and rename
    nnoremap <silent><buffer><expr> y defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    " New file and directory
    nnoremap <silent><buffer><expr> F defx#do_action('new_file')
    nnoremap <silent><buffer><expr> D defx#do_action('new_directory')
    " Move up a directory
    nnoremap <silent><buffer><expr> u defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> 2u defx#do_action('cd', ['../..'])
    nnoremap <silent><buffer><expr> 3u defx#do_action('cd', ['../../..'])
    nnoremap <silent><buffer><expr> 4u defx#do_action('cd', ['../../../..'])
    " Home directory
    nnoremap <silent><buffer><expr> h defx#do_action('cd')
    " Mark a file
    nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
    " Toggle hidden files
    nnoremap <silent><buffer><expr> <Leader>th
        \ defx#do_action('toggle_ignored_files')
    " Redraw
    nnoremap <silent><buffer><expr> <C-r> defx#do_action('redraw')
    " Toggle sorting from filename to time (with last modified first)
    nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'Time')
    " Toggle columns to show time
    nnoremap <silent><buffer><expr> T defx#do_action('toggle_columns',
        \ 'icons:filename:time')
    " Open new defx buffer
    nnoremap <silent><buffer> <Leader>sp :execute
        \ 'Defx -new -split=horizontal -direction= ' . b:defx.paths[0]<CR>
        \ :wincmd p<CR>:execute float2nr(&lines /2) . 'wincmd _ '<CR>
    " change local window working dir to current dir
    nnoremap <silent><buffer> <Leader>cd :execute 'lcd' . b:defx.paths[0]<CR>
    " History source
    nnoremap <silent><buffer> <C-h> :Denite defx/history<CR>
    " Bookmarks source
    nnoremap <silent><buffer> b :Denite defx/dirmark<CR>

    " Resize window
    nnoremap <silent><buffer><expr> <A-l> defx#do_action('resize',
        \ defx#get_context().winwidth + 5)
    nnoremap <silent><buffer><expr> <A-h> defx#do_action('resize',
        \ defx#get_context().winwidth - 5)

    " Custom actions
    function! s:GetDefxBaseDir(candidate) abort
        if line('.') == 1
            let path_mod  = 'h'
        else
            let path_mod = isdirectory(a:candidate) ? 'h:h' : 'h'
        endif
        return fnamemodify(a:candidate, ':p:' . path_mod)
    endfunction
    function! s:denite_rec(context) abort
        let narrow_dir = s:GetDefxBaseDir(a:context.targets[0])
        execute 'Denite -default-action=defx ' .
                    \ 'file/rec:' . narrow_dir
    endfunction
    function! s:denite_rec_no_ignore(context) abort
        let narrow_dir = s:GetDefxBaseDir(a:context.targets[0])
        execute 'Denite -default-action=defx ' .
                    \ 'file/rec/noignore:' . narrow_dir
    endfunction
    function! s:denite_dir_rec(context) abort
        let narrow_dir = s:GetDefxBaseDir(a:context.targets[0])
        execute 'Denite -default-action=defx ' .
                    \ 'directory_rec:' . narrow_dir
    endfunction
    function! s:denite_dir_rec_no_ignore(context) abort
        let narrow_dir = s:GetDefxBaseDir(a:context.targets[0])
        execute 'Denite -default-action=defx ' .
                    \ 'directory_rec/noignore:' . narrow_dir
    endfunction
    function! s:denite_z(context) abort
        execute 'Denite -default-action=defx z'
    endfunction
    function! s:denite_parents_dirs(context) abort
        let narrow_dir = s:GetDefxBaseDir(a:context.targets[0])
        execute 'Denite -default-action=defx ' .
                    \ 'parent_dirs:' . narrow_dir
    endfunction
    function! s:defx_ranger(context) abort
        let narrow_dir = s:GetDefxBaseDir(a:context.targets[0])
        call s:TmuxSplitCmd('ranger', narrow_dir)
    endfunction
    nnoremap <silent><buffer><expr> <C-t>
                \ defx#do_action('call', '<SID>denite_rec')
    nnoremap <silent><buffer><expr> <A-t>
                \ defx#do_action('call', '<SID>denite_rec_no_ignore')
    nnoremap <silent><buffer><expr> <A-c>
                \ defx#do_action('call', '<SID>denite_dir_rec')
    nnoremap <silent><buffer><expr> <A-d>
                \ defx#do_action('call', '<SID>denite_dir_rec_no_ignore')
    nnoremap <silent><buffer><expr> <A-z>
                \ defx#do_action('call', '<SID>denite_z')
    nnoremap <silent><buffer><expr> <A-p>
                \ defx#do_action('call', '<SID>denite_parents_dirs')
    nnoremap <silent><buffer><expr> ge
                \ defx#do_action('call', '<SID>defx_ranger')
endfunction



" Avoid the white space highting issue
" autocmd FileType defx match ExtraWhitespace /^^/
" Keymap in defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction


" " 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
" let g:maplocalleader=';'
" nnoremap <silent> <LocalLeader>e
" \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <silent> <LocalLeader>a
" \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
"
" function! s:defx_mappings() abort
"     " Defx window keyboard mappings
"     setlocal signcolumn=no
"     " 使用回车打开文件
"     nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
" endfunction


"--------------------------------------------------------------
" Defx git
" Plug 'kristijanhusak/defx-git'
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

"--------------------------------------------------------------
" Defx icons
" Plug 'kristijanhusak/defx-icons'
" 
" Requires nerd-font, install at https://github.com/ryanoasis/nerd-fonts or
" brew cask install font-hack-nerd-font
" Then set non-ascii font to Driod sans mono for powerline in iTerm2
" disbale syntax highlighting to prevent performence issue
" 
let g:defx_icons_enable_syntax_highlight = 0

let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

" Override colors
let g:defx_icons_gui_colors = {
\ 'red': 'FFFFFF'
\ }

let g:defx_icons_term_colors = {
\ 'red': 2
\ }

" for directory icons these highlight groups are defined 
hi default link DefxIconsMarkIcon Statement
hi default link DefxIconsDirectory Directory
hi default link DefxIconsParentDirectory Directory
hi default link DefxIconsSymlinkDirectory Directory
hi default link DefxIconsOpenedTreeIcon Directory
hi default link DefxIconsNestedTreeIcon Directory
hi default link DefxIconsClosedTreeIcon Directory

" to change color of the directory icon when it's opened in tree to red color
hi DefxIconsOpenedTreeIcon guifg=#FF0000


let g:defx_icons_extensions = {
            \ 'tex': {'icon': ''},
            \ 'bib': {'icon': ''},
            \ 'gitcommit': {'icon': ''},
            \ 'pdf': {'icon': ''},
            \ 'r': {'icon': 'ﳒ'},
            \ 'R': {'icon': 'ﳒ'},
            \ }
let g:defx_icons_exact_matches = {
            \ '.gitconfig': {'icon': ''},
            \ '.gitignore': {'icon':''},
            \ 'bashrc': {'icon': ''},
            \ '.bashrc': {'icon': ''},
            \ 'bash_profile': {'icon':''},
            \ '.bash_profile': {'icon':''},
            \ }
let g:defx_icon_exact_dir_matches = {
            \ '.git'     : {'icon': ''},
            \ 'Desktop'  : {'icon': ''},
            \ 'Documents': {'icon': ''},
            \ 'Downloads': {'icon': ''},
            \ 'Dropbox'  : {'icon': ''},
            \ 'Music'    : {'icon': ''},
            \ 'Pictures' : {'icon': ''},
            \ 'Public'   : {'icon': ''},
            \ 'Templates': {'icon': ''},
            \ 'Videos'   : {'icon': ''},
            \ }




"--------------------------------------------------------------
" 設定檔作業

" 編輯設定檔
nmap <Leader>i :tabnew ~/.config/nvim/init.vim<CR>
nmap cfi :tabnew ~/.config/nvim/nvim_init.vim<CR>
nmap cff :tabnew ~/.config/nvim/nvim_format.vim<CR>
nmap cfk :tabnew ~/.config/nvim/nvim_keymap.vim<CR>
nmap cfp :tabnew ~/.config/nvim/nvim_plugin.vim<CR>
nmap cfc :tabnew ~/.config/nvim/coc-settings.json<CR>

" 依據設定檔重啟設定
nmap cfI :source ~/.config/nvim/init.vim<CR>
nmap <Leader>I :source ~/.config/nvim/init.vim<CR>


"--------------------------------------------------------------
" 文字編輯

" 註釋
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" 復行一次
nnoremap U <C-r>


" 游標所在處到行尾的文字，將之複製
nnoremap Y y$


" 行間操作
nnoremap H ^									" 游標移到行頭
nnoremap L $									" 游標移到行尾


" 搬移文字
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

nnoremap <M-Down> :m .+1<CR>==
nnoremap <M-Up>   :m .-2<CR>==
inoremap <M-Down> :m .+1<CR>==
inoremap <M-Up>   :m .-2<CR>==


imap <M-Enter>  <Esc>o
imap <Leader>o  <Esc>o
imap <C-l>      <Esc>o
imap <Leader>O  <Esc>O
imap <C-L>      <Esc>O


"--------------------------------------------------------------
" 游標移動


" 在「挿入模式」移動游標
" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>
" inoremap <C-a> <Home>
" inoremap <C-e> <End>
" inoremap <C-d> <Delete>


"--------------------------------------------------------------
" 程式碼編輯


" 設定〔行號〕顯示模式
nmap <Leader>nr :set relativenumber<CR>
nmap <Leader>nn :set norelativenumber<CR>


" Python 專用
imap <Leader>, <Esc>A,
imap <M-,> <Right>,<Space>

imap <Leader>. <Esc>A.
imap <M-.> <Right>.<Space>

imap :: <Esc>A:
imap <C-:> <Right>:<Left>

imap ;; <Esc>A;

" JavaScript
imap <Leader>{ <Esc>A<Space>{}<Left>
imap <Leader>$ $();<Left><Left>


"--------------------------------------------------------------
" 視窗操作

" 切割視窗指令：
"  - 水平切割： :sp   ==>  :10sp [FileName]10+
"  - 垂直切割： :vsp  ==>  :vsp [FileName]
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

"<C-w>_ ：視窗高度最大化（適用於水平切割視窗）
"<C-w>| ：視窗寬度最大化（適用於垂直切割視窗）
"<C-w>= ：視窗寬高平均化（適用於任何切割視窗）


" 調整視窗大小尺寸
" nmap <C-w><left>  <C-w><    " 水平往左
" nmap <C-w><right> <C-w>>    " 水平往右
" nmap <C-w><up>    <C-w>+    " 垂直往上
" nmap <C-w><down>  <C-w>-    " 垂直往下

nmap <S-left>  <C-w><       " 水平往左
nmap <S-right> <C-w>>       " 水平往右
nmap <S-up>    <C-w>+       " 垂直往上
nmap <S-down>  <C-w>-       " 垂直往下


" <C-w>r: Swap top/bottom or left/right splitjj
" <C-w>t: Break out current window into a new tabview
" <C-w>o: Close every window in the current tabview but the current one

"<C-W>w ：遊標移往下一個視窗
nnoremap <Leader>ww <C-W>w 		" 遊標移至下一個視窗
nnoremap <Leader>wc <C-W>c    " 關閉遊標所在視窗
nnoremap <Leader>wj <C-W>j 		" 遊標移至垂直下方的視窗
nnoremap <Leader>wk <C-W>k 		" 遊標移至垂直上方的視窗
nnoremap <Leader>wh <C-W>h		" 遊標移至水平左方的視窗
nnoremap <Leader>wl <C-W>l		" 遊標移至水平右方的視窗
nnoremap <Leader>ws <C-W>s 		" 遊標所在視窗做垂直切割
nnoremap <Leader>w- <C-W>s 		" 遊標所在視窗做垂直切割
nnoremap <Leader>wv <C-W>v 		" 遊標所在視窗做水平切割
nnoremap <Leader>w\| <C-W>v		" 遊標所在視窗做水平切割

" window Zoom-in/Zoon-out
nmap <Leader>wi <C-W>_ \| <c-w>\|
nmap <Leader>wo <C-W>=


" 在 Tab 視窗移動
map <Leader>p <esc>:tabprevious<CR>
map <Leader>n <esc>:tabnext<CR>


" 半視窗捲動
nnoremap <Leader>d  <C-d>			" 往下捲動半個視窗
nnoremap <Leader>u  <C-u>			" 往上捲動半個視窗


" Tab operation
nnoremap tn gt
nnoremap tp gT


