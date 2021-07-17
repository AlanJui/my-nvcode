" 設定 <Leader> 鍵
let mapleader = ","


"======================================================================
" 快速鍵設定
"======================================================================

"--------------------------------------------------------------
" 視窗操作

" 切割視窗指令：
"  - 水平切割： :sp   ==>  :10sp [FileName]10+
"  - 垂直切割： :vsp  ==>  :vsp [FileName]
" nnoremap <Leader>wv <C-W>v 		" 遊標所在視窗做垂直切割
" nnoremap <Leader>w_ <C-W>v 		" 遊標所在視窗做垂直切割
" nnoremap <Leader>ws <C-W>s 		" 遊標所在視窗做水平切割
" nnoremap <Leader>w- <C-W>s 		" 遊標所在視窗做水平切割
" nnoremap <Leader>w\| <C-W>v		" 遊標所在視窗做垂直切割

nmap <Leader>wv <C-W>v 		" 遊標所在視窗做垂直切割
nmap <Leader>w_ <C-W>v 		" 遊標所在視窗做垂直切割
nmap <Leader>ws <C-W>s 		" 遊標所在視窗做水平切割
nmap <Leader>w- <C-W>s 		" 遊標所在視窗做水平切割
nmap <Leader>w\| <C-W>v		" 遊標所在視窗做垂直切割

" 調整視窗的寬度／高度
" 指令：resize (res)
" 水平調整格式：
"  (1) :res 60
"  (2) :res +5
"  (3) :res -5
" 垂直調整格式：
"  (1) :vertical res 60
"  (2) :vertical res +5
"  (3) :vertical res -5
nmap <S-left>  <C-w><       " 水平往左
nmap <S-right> <C-w>>       " 水平往右
nmap <S-up>    <C-w>+       " 垂直往上
nmap <S-down>  <C-w>-       " 垂直往下

nmap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nmap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nmap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nmap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" 調整視窗大小尺寸
"<C-w>_ ：視窗高度最大化（適用於水平切割視窗）
"<C-w>| ：視窗寬度最大化（適用於垂直切割視窗）
"<C-w>= ：視窗寬高平均化（適用於任何切割視窗）


" 搬移視窗座落位置
" <C-w>r: Swap top/bottom or left/right splitjj
" <C-w>t: Break out current window into a new tabview
" <C-w>o: Close every window in the current tabview but the current one


" 在視窗間移動游標
nmap <Leader>ww <C-W>w 		" 遊標移至下一個視窗
nmap <Leader>wc <C-W>c      " 關閉遊標所在視窗

nmap <Leader>wj <C-W>j 		" 遊標移至垂直下方的視窗
nmap <C-j>      <C-W>j 		" 遊標移至垂直下方的視窗

nmap <Leader>wk <C-W>k 		" 遊標移至垂直上方的視窗
nmap <C-k>      <C-W>k 		" 遊標移至垂直上方的視窗

nmap <Leader>wh <C-W>h		" 遊標移至水平左方的視窗
nmap <C-h>      <C-W>h		" 遊標移至水平左方的視窗

nmap <Leader>wl <C-W>l		" 遊標移至水平右方的視窗
nmap <C-l>      <C-W>l		" 遊標移至水平右方的視窗


" window Zoom-in/Zoon-out
nmap <Leader>wi <C-W>_ \| <c-w>\|
nmap <Leader>wo <C-W>=


" 半視窗捲動
nmap <A-m> zt
nmap <C-m> zb

" 在 Tab 視窗移動
nmap <Leader>p <esc>:tabprevious<CR>
nmap <Leader>n <esc>:tabnext<CR>


" Tab operation
nmap tn gt
nmap tp gT


"--------------------------------------------------------------
" 文字編輯

" 離開插入模式，回返一般模式
imap jj <Esc>
imap jk <Esc>

" 進入「貼上（Paste）」模式
set pastetoggle=<F2>

" 復行一次
nmap U <C-r>

"--------------------------------------------------------------
" 程式碼編輯


" 設定〔行號〕顯示模式
nmap <C-l><C-l> :set rnu!<CR>
nmap <Leader>nr :set relativenumber<CR>
nmap <Leader>nn :set norelativenumber<CR>


" Python 專用
imap ,, <Esc>A,
imap ,,, <Right>,

imap .. <Esc>A.
imap ... <Right>.

imap :: <Esc>A:
imap ::: <Right>:

imap ;; <Esc>A;
imap ;;; <Right>;

" JavaScript
imap <Leader>{ <Esc>A<Space>{}<Left>
imap <Leader>$ $();<Left><Left>

"--------------------------------------------------------------
" 行編輯

" 不離開插入模式下，在游標下新插入一行
imap <Leader>o  <Esc>o
imap <Leader>O  <Esc>O

" 游標所在處到行尾的文字，將之複製
"nnoremap Y y$
nmap Y yy
nmap D dd

" 行間操作
nmap H ^									" 游標移到行頭
nmap L $									" 游標移到行尾


" 搬移文字(Move Line)
nmap <S-DOWN> :m .+1<CR>==
nmap <S-UP> :m .-2<CR>==
imap <S-DOWN> <Esc>:m .+1<CR>==gi
imap <S-UP> <Esc>:m .-2<CR>==gi
vmap <S-DOWN> :m '>+1<CR>gv=gv
vmap <S-UP> :m '<-2<CR>gv=gv

nmap <A-j> :m .+1<CR>
nmap <A-k> :m .-2<CR>
imap <A-j> <Esc>:m .+1<CR>
imap <A-k> <Esc>:m .-2<CR>
vmap <A-j> :m '>+1<CR>
vmap <A-k> :m '<-2<CR>


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
" 跳脫 Visual Mode
vmap v <Esc>


" Automatically re-read file if a change was detected outside of vim
set autoread

" 關閉目前正編輯的檔案
nmap <Leader>fc :bd<CR>      " 已存檔
nmap <Leader>fC :bd!<CR>     " 已編輯，不存檔，強迫關閉


" 儲存檔案
nmap <Leader>w :w!<CR>
imap <Leader>w <Esc>:w!<CR>
vmap <Leader>w :w!<CR>

nmap <C-s> :w!<CR>
imap <C-s> <Esc>:w!<CR>
vmap <C-s> :w!<CR>


" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %


" 退出 Vim
nmap <C-q> :quit<CR>
nmap <C-Q> :qa!<CR>


" === Search shorcuts === "
"   <leader>s - Find and replace
"   <leader>S - Claer highlighted search terms while preserving history
nmap <leader>s :%s///<left><left>

" 清除搜尋完後的醒目提示
nmap <silent> <leader>S :nohlsearch<CR>


