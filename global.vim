"==============================================================
" Vim 通用設定
"==============================================================

" 與作業系統共用 Clipboard
" 欲將系統剪貼簿的內容貼入 Vim 前，需先按 <F2> 鍵。
set clipboard=unnamed

set undolevels=700
set history=1000
set timeout timeoutlen=500


"--------------------------------------------------------------
" 應用系統層級設定

" User will have bad experience for diagnostic messages when it's default 4000
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
" set signcolumn=yes

set nocompatible            " Disable compatibility to old-time vi
set encoding=UTF-8

set mouse=a


"--------------------------------------------------------------
" 檔案作業

" 支援的檔案格式
set fileformats=unix,dos,mac

" 停用 backup 與 swap 功能
set nobackup
set nowritebackup
set noswapfile

" 文字搜尋：Serach configuration
set ignorecase              " 搜尋時怱略英文字母的大小寫
set smartcase               " turn on smartcase
set incsearch
set hlsearch                " highlight search results


"==============================================================
" 操作介面
"==============================================================

" 視窗管理
set splitbelow      " 水平切割時，在下產生新視窗
set splitright      " 垂直切割時，在右產生新視窗
set scrolloff=3

"--------------------------------------------------------------
" 狀態列（Status Line）
  
" Better display for messages
set cmdheight=2

" Don't show last command
set noshowcmd

" Don't show Insert/Command Mode 
set noshowmode
" set showmode

" Show matching brackets.
set showmatch               

" Show key pressed on status line
set showcmd

" 執行時不重繪 
set nolazyredraw

