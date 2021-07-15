"===========================================================
" Maintainer:
"       Alan Jui : alanjui.1960@gmail.com
" Version:
"       V 0.7.0    2021/02/09 20:56
"===========================================================

scriptencoding utf-8
set shell=$SHELL
set nocompatible
let g:mapleader = ","

au FocusGained,BufEnter * :silent! checktime
au FocusLost,WinLeave * :silent! w

let g:python3_host_prog = expand("$HOME/.pyenv/versions/3.9.1/bin/python3.9")
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
    source ~/.config/my-nvim/format.vim
    source ~/.config/my-nvim/keymap.vim
else
    " Neovim Plugins

    " 需安裝之擴充套件
    source ~/.config/my-nvim/plugins.vim

    " 擴充套件設定（Configuration of Plugins)
    source ~/.config/my-nvim/config/ranger.vim
    source ~/.config/my-nvim/config/fzf.vim
    source ~/.config/my-nvim/config/surround.vim
    source ~/.config/my-nvim/config/auto-pairs.vim
    source ~/.config/my-nvim/config/multiple-cursors.vim
    source ~/.config/my-nvim/config/simply-fold.vim
    source ~/.config/my-nvim/config/nerd-commenter.vim
    source ~/.config/my-nvim/config/change-tag-name.vim
    source ~/.config/my-nvim/config/live-server.vim
    source ~/.config/my-nvim/config/markdown-preview.vim
    source ~/.config/my-nvim/config/window-swap.vim
    source ~/.config/my-nvim/config/float-term.vim
    source ~/.config/my-nvim/config/echodoc.vim
    source ~/.config/my-nvim/config/plantuml-previewer.vim
    source ~/.config/my-nvim/config/find-and-replace.vim
    source ~/.config/my-nvim/config/instant-markdown.vim

    "===========================================================
    " Vim 通用設定
    "===========================================================
    source ~/.config/my-nvim/global.vim

    "==========================================================
    " 程式碼版面與格式設定
    "==========================================================
    source ~/.config/my-nvim/format.vim

    " Fix conflicts with indentLine and vim-json
    let g:vim_json_syntax_conceal=0
    let g:indentLine_noConcealCursor=""
    let g:indentLine_noConcealCursor="nc"

    "==========================================================
    " COC-NVIM 配合環境
    "==========================================================
    source ~/.config/my-nvim/coc-nvim.vim
    source ~/.config/my-nvim/config/coc-explorer.vim

    "==========================================================
    " 快速鍵設定
    "==========================================================
    source ~/.config/my-nvim/keymap.vim

    source ~/.config/my-nvim/config/which-key.vim

    "==========================================================
    " 使用者操作介面設定
    "==========================================================
    source ~/.config/my-nvim/UI.vim

    " Theme Colors
    " source ~/.config/my-nvim/config/color-theme-ccc.vim
    " if exists("&termguicolors") && exists("&winblend")
    "     let g:neosolarized_termtrans=1
    "     runtime ~/.config/my-nvim/colors/solarized_true.vim
    "     set termguicolors
    "     set winblend=0
    "     set wildoptions=pum
    "     set pumblend=5
    " else
    "     " colorscheme gruvbox
    "     set background=dark
    "     colorscheme solarized8
    " endif
    set background=dark
    colorscheme solarized8

    " Status line
    " source ~/.config/my-nvim/config/light-line.vim
    source ~/.config/my-nvim/config/airline-theme.vim

    "==========================================================
    " 其它設定
    "==========================================================
    source ~/.config/my-nvim/Misc.vim

    if has("unix")
      let s:uname = system("uname -s")
      " Do Mac stuff
      if s:uname == "Darwin\n"
        source ~/.config/my-nvim/config/clipboard-osx.vim
      endif
    endif


    set exrc


    let g:vim_markdown_conceal = 0
    let g:vim_markdown_conceal_code_blocks = 0

    command! -nargs=0 Prettier :CocCommand prettier.formatFile

endif
