"===========================================================
" Maintainer:
"       Alan Jui : alanjui.1960@gmail.com
" Version:
"       V 0.7.0    2021/02/09 20:56
"===========================================================

scriptencoding utf-8
" set shell=$SHELL
set shell=zsh
set nocompatible
let g:mapleader = ","

au FocusGained,BufEnter * :silent! checktime
au FocusLost,WinLeave * :silent! w

let g:python3_host_prog = expand("$HOME/.pyenv/versions/venv-nvim/bin/python3")
let g:node_host_prog = expand("$HOME/n/bin/neovim-node-host")

let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

"===========================================================
" 擴充套件(Plugins)
"===========================================================
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

if exists('g:vscode')
    " VSCode extension
    source ~/.config/coc-nvim/config/format.vim
    source ~/.config/coc-nvim/config/keymap.vim
    runtime 'vscode.vim'
else
    " Neovim Plugins

    " 需安裝之擴充套件
    source ~/.config/coc-nvim/config/plugins.vim

    " 擴充套件設定（Configuration of Plugins)
    " 除了使用以下 souerce 指令載入設定外，亦可將各 Plugin 的設定檔 (.vim/.lua)
    " ，置放在目錄路徑： ~/.config/nvim/after/plugin/ 處。
    " source ~/.config/coc-nvim/config/fzf.vim

    "==========================================================
    " COC-NVIM 設定
    "==========================================================
    source ~/.config/coc-nvim/coc-nvim.vim

    "==========================================================
    " 載入 Lua 設定檔
    "==========================================================
    " lua vim.cmd("let g:indent_blankline_filetype_exclude = ['dashboard']")
    execute "lua require('config')"

    "===========================================================
    " Vim 通用設定
    "===========================================================
    source ~/.config/coc-nvim/config/global.vim

    "==========================================================
    " 程式碼版面與格式設定
    "==========================================================
    source ~/.config/coc-nvim/config/format.vim

    "==========================================================
    " 快速鍵設定
    "==========================================================
    source ~/.config/coc-nvim/config/keymap.vim

    "==========================================================
    " 使用者操作介面設定
    "==========================================================
    " Theme Colors
    " source ~/.config/coc-nvim/config/color-theme-ccc.vim
    if exists("&termguicolors") && exists("&winblend")
      syntax enable
      set termguicolors
      set winblend=0
      set wildoptions=pum
      set pumblend=5
      set background=dark
      " Use NeoSolarized
      let g:neosolarized_termtrans=1
      " runtime ./colors/NeoSolarized.vim
      " colorscheme NeoSolarized
      colorscheme solarized8
    else
      set background=dark
      colorscheme gruvbox
    endif

    source ~/.config/coc-nvim/config/UI.vim

    " Status line
    execute "lua require('plugins.statusline')"
    " runtime ~/.config/coc-nvim/after/plugin/statusline.luv
    " source ~/.config/coc-nvim/after/plugin/airline-theme.vim
    " luafile ~/.config/coc-nvim/lua/plugins/galaxyline/init.lua

    "==========================================================
    " 其它設定
    "==========================================================
    source ~/.config/coc-nvim/config/Misc.vim

    if has("unix")
      let s:uname = system("uname -s")
      " Do Mac stuff
      if s:uname == "Darwin\n"
        source ~/.config/coc-nvim/config/clipboard-osx.vim
      endif
    endif

    set exrc

endif
