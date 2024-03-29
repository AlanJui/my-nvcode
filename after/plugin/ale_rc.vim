" linters options: flake8, pydocstyle, bandit, mypy, pylint, all
let g:ale_linters = {
\   'python': ['flake8', 'pydocstyle', 'bandit', 'mypy'],
\}

" Fixer: reformatting code
" fixers options: black, yapf, autopep8
" let g:ale_fixers = {'python': ['isort', 'black', 'remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'autopep8'],
\}

let g:ale_lsp_suggestions = 1
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Code completion: Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
"
" If you’ve already installed ale and you want another plugin for code completion, remember to set thi
let g:ale_completion_enabled = 0

" omni-completion function: use for triggering completion manually with <C-x><C-o>
" set omnifunc=ale#completion#OmniFunc

nmap <F10> :ALEFix<CR>


function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}
