"--------------------------------------------------------------
" 佈景、配色與字體

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && $TERM_PROGRAM == "Apple_Terminal" && $TERM == "xterm-256color")

  " 不支援 24-bit 全彩的終端機，如：macOS Terminal.app
  set notermguicolors
  set background=dark

  try
    colorscheme solarized8
  catch
    colorscheme gruvbox
  endtry

else
  " 支援 24-bit 全彩的終端機，如：iTerm 2
  "
  " ======= 在 Tmux 中: =======
  " exists("$TERM") == 1
  " $TERM == "screen-256color"
  " $COLORTERM='truecolor'
  " ======= 在 Nvim 中: =======
  " has("nvim") == 1
  " has("termguicolors") == 1

  syntax enable

  try
    colorscheme solarized8
  catch
    colorscheme gruvbox
  endtry

endif

" if exists("&termguicolors") && exists("&winblend")
"     let g:neosolarized_termtrans=1
"     runtime ~/.vim/colors/solarized_true.vim
"     set termguicolors
"     set winblend=0
"     set wildoptions=pum
"     set pumblend=5
" else
"     set background=dark
"     colorscheme solarized8
" endif

