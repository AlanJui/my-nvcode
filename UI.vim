"=================================================================== "
" 使用者操作介面（UI）
"=================================================================== "


" 行號顯示
set number                  " 顯示行號
set relativenumber          " 在遊標所在處顯示相對行號

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

" 狀態列需顯示「檔案類型」
filetype on

"-------------------------------------------------------------------------------
" Cursor line
"-------------------------------------------------------------------------------

set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif



