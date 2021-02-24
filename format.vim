"==============================================================
" 程式碼排版
"==============================================================


" 行號顯示
set number                  " 顯示行號
set relativenumber          " 在遊標所在處顯示相對行號
set cursorline

" 令程式碼檔案可有語法（Syntax）高亮標示
syntax on
filetype on
set background=dark

" 程式碼排版規範
set colorcolumn=80          " 設定每行能放 80 個字元

" 自動換行控制
set nowrap                  " 不用依據 colorcolumn 的規範，在自動換行
" set wrap                    " 設定自動換行

" 自動縮排控制
filetype indent on
set autoindent              "ai: indent a new line the same amount as the line just typed
set smartindent             "si: Smart indent

" Tab 與空白控制
set expandtab				" always uses spaces instead of tab characters
set softtabstop=4
set shiftwidth=4
set tabstop=4

" set backspace=2
set backspace=start,eol,indent

" 標示多餘空白【務必放在 ColorScheme 設定之前】
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
autocmd FileType py,html,htmldjango,javascript,css autocmd BufWritePre <buffer> %s/\s\+$//e


" 不同 filetype 擁有各自的 "內縮設定" ，如： Python 為4空格；HTML則為2空格
filetype plugin indent on
" filetype off
" set smarttab
" set cindent
" set shiftround

" 設定「註解」預設符號
let b:comment_leader='//'

" 依據 filetype 設定 Tab 應有的內縮空白格式
autocmd FileType vim let b:comment_leader='"'

" 在 Insert Mode 可用 《BS》鍵
set backspace=indent,eol,start

" --- 自動去除不必要的空白 ---
highlight BadWhitespace ctermbg=red guibg=darkred

autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /^\t\+/
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"--------------------------------------------------------------
" JavaScrip

autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript let b:comment_leader='//'


"--------------------------------------------------------------
" TypeScript

au BufNewFile,BufRead *.ts set filetype=typescript
autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType typescript let b:comment_leader='//'

au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd FileType typescript.tsx setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType typescript.tsx let b:comment_leader='//'


"--------------------------------------------------------------
" CSS

autocmd BufNewFile,BufRead *.css,*.scss set filetype=css
" autocmd FileType css setlocal tabstop=4 shiftwidth=4
autocmd FileType css setlocal expandtab softtabstop=4 shiftwidth=4
autocmd FileType css let b:comment_leader='/*'


"--------------------------------------------------------------
" Python

" autocmd BufNewFile,BufRead *.py set filetype=python.django
autocmd BufNewFile,BufRead *.py set filetype=python
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType python let b:comment_leader='#'

" tabstop(ts), shiftwidth(sw) and softtabstop(sts)
" autocmd FileType python set sw=4
" autocmd FileType python set ts=4
" autocmd FileType python set sts=4


"--------------------------------------------------------------
" Django Template

autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd FileType htmldjango setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType htmldjango let b:comment_leader='<!--'


" === 自行判斷 filetype 是否為 htmldjango ===
" 判別是否適用 django-html 檔案格式
" 可能選項：
"  (1) {% extends
"  (2) {% block
"  (3) {% load
"  (4) {#
" Regex Express 判別式：
"  (1) {%\s*\(extends\|block\|load\)\>\|{#\s\+
"  (2) {%\|{{\|{#

" augroup filetypedetect
"   " removes current htmldjango detection located at $VIMRUNTIME/filetype.vim
"   autocmd! BufNewFile,BufRead *.html
"   autocmd  BufNewFile,BufRead *.html call FThtml()
"
"   func! FThtml()
"     let n = 1
"     while n < 10 && n < line("$")
"       if getline(n) =~ '\<DTD\s\+XHTML\s'
"         setf xhtml
"         return
"       endif
"       if getline(n) =~ '{%\|{{\|{#'
"         setf django-html
"         return
"       endif
"       let n = n + 1
"     endwhile
"     "setf html
"     setf html
"   endfunc
" augroup END

" === 自動配對 ===
" Buffer local pairs
" autocmd FileType htmldjango let b:coc_pairs = ["{%"]

" === Tab Stop ===
" autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
" autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
" autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
" autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>


"--------------------------------------------------------------
" Markdown

" To disable characters for a specified filetype
" autocmd FileType markdown let b:coc_pairs_disabled = ['`']
autocmd BufNewFile, BufRead *.md set filetype=markdown
