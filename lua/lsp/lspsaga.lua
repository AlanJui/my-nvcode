local saga = require 'lspsaga'

-- add your config value here
-- default value
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- "single" "double" "round" "plus"
-- border_style = "single"
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}

saga.init_lsp_saga {
	error_sign = '⛔️',
	warn_sign = '🆖',
	hint_sign = '🈯️',
	infor_sign = '💬',
	border_style = "round",
}

-- mapping
vim.cmd "nmap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>"
vim.cmd "map  <silent>K      <Cmd>Lspsaga hover_doc<CR>"
vim.cmd "imap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>"
vim.cmd "nmap <silent> gh    <Cmd>Lspsaga lsp_finder<CR>"
