"============================================================
" Vim 擴充套件設定檔
"============================================================


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" check whether vim-plug is installed and install it if necessary
if empty(glob('~/.config/coc-nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/coc-nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


"============================================================
" 擴充套件安裝
"============================================================


call plug#begin('~/.config/coc-nvim/plugged')

" To conditionally activate plugins, vim-plug has a few solutions. For example,
" using the Cond helper, you can conditionally activate installed plugins

" inside plug#begin:
" use normal easymotion when in vim mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

if exists('g:vscode')
  " 適用於 VS Code 的 Plugin 置於此處
else
    "------------------------------------------------------------
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'

    "------------------------------------------------------------
    " Python
    Plug 'dense-analysis/ale'

    "------------------------------------------------------------
    " 編輯

    " Auto-complete (Intellisense Engine)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Or build from source code by using yarn: https://yarnpkg.com
    " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

    " Snippets support
    Plug 'honza/vim-snippets'
    Plug 'https://github.com/andys8/vscode-jest-snippets.git'

    " Auto-pairs
    Plug 'jiangmiao/auto-pairs/'
    Plug 'tpope/vim-surround'

    " Multiple cursor editting
    Plug 'terryma/vim-multiple-cursors'

    " Comment code
    "Plug 'scrooloose/nerdcommenter'
    Plug 'terrortylor/nvim-comment'

    " Print function signatures in echo area
    Plug 'Shougo/echodoc.vim'

    " The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches.
    Plug 'mbbill/undotree'

    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'

    " Makes it easier to find and replace text through multiple files.
    Plug 'brooth/far.vim'

    "------------------------------------------------------------
    " 程式排版 & 視覺導引

    " Code folding
    Plug 'tmhedberg/SimpylFold'

    " Displaying thin vertical lines
    " Plug 'Yggdroot/indentLine'
    Plug 'lukas-reineke/indent-blankline.nvim'

    " === Syntax Highlighting === "

    " Syntax highlighting for nginx
    " Plug 'chr4/nginx.vim'

    " Syntax for json with comments
    " Plug 'elzr/vim-json'
    " Plug 'neoclide/jsonc.vim'

    " Syntax highlighting for javascript libraries
    " Plug 'othree/javascript-libraries-syntax.vim'


    "------------------------------------------------------------
    " 檔案操作

    " File manage and exploration
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " === Git Plugins === "
    " Enable git changes to be shown in sign column
    Plug 'airblade/vim-gitgutter'
    " Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'


    "------------------------------------------------------------
    " 使用者操作介面

    Plug 'glepnir/dashboard-nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " File manage and exploration
    Plug 'kyazdani42/nvim-web-devicons' " for file cions
    Plug 'kyazdani42/nvim-tree.lua'

    " Status line
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'

    " Galaxy Line
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    " 選單畫面
    Plug 'liuchengxu/vim-which-key'

    " Float Terminal
    Plug 'voldikss/vim-floaterm'

    " Swap windows
    Plug 'wesQ3/vim-windowswap'

    " Add file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline
    Plug 'ryanoasis/vim-devicons'

    " Color Scheme: Support True Color
    Plug 'lifepillar/vim-solarized8'
    Plug 'morhetz/gruvbox'

    " If you want to display icons, then use one of these plugins:
    Plug 'ryanoasis/vim-devicons' " vimscript

    "------------------------------------------------------------
    " 其它

    " Live Server
    " Plug 'turbio/bracey.vim'
    Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

    " PlantUML
    Plug 'aklt/plantuml-syntax'
    Plug 'tyru/open-browser.vim'
    Plug 'weirongxu/plantuml-previewer.vim'

    "------------------------------------------------------------
    " Markdown syntax highlighting
    " Plug 'gabrielelana/vim-markdown'
    Plug 'tpope/vim-markdown'
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

    " Markdown Preview
    " If you don't have nodejs and yarn
    " use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
    " see: https://github.com/iamcco/markdown-preview.nvim/issues/50
    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    " If you have nodejs and yarn
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

endif

call plug#end()
