-- configure plugin: lspsaga
require('lsp.lspsaga')

-- setup Lua Language Server
require('lsp.lua-ls')

-- setup TypeScript Language Server
require('lsp.typescript-ls')

-- load plugins
require('plugins.nvim-treesitter')
require('plugins.dashboard-nvim')
require('plugins.statusline')
require('plugins.telescope')
require('plugins.indent-blankline')
require('plugins.nvim_comment')
