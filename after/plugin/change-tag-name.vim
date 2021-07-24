" https://github.com/AndrewRadev/tagalong.vim
"
" Here's the methods that work with the plugin:
"  - c:      Anything involving a c operation, including cw, ci<, cE, or C.
"  - v + c:  Selecting anything in visual mode and changing it with a c.
"  - i, a:   Entering insert mode and making direct changes.

let g:tagalong_filetypes = [
      \ 'html',
      \ 'htmldjango',
      \ 'javascript',
      \ 'javascriptreact',
      \ 'typescriptreact',
      \ 'jsx',
      \ 'xml'
      \ ]
let g:tagalong_verbose = 1
