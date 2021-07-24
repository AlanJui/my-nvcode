if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

socSearch 

	error_sign = '⛔️',
	warn_sign = '🆖',
	hint_sign = '🈯️',
	infor_sign = '💬',
	border_style = "round",
}
EOF

nmap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nmap <silent>K  <Cmd>Lspsaga hover_doc<CR>
imap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nmap <silent> gh  <Cmd>Lspsaga lsp_finder<CR>

