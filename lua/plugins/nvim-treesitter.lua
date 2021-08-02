require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = treu,
		disable = {},
	},
	indent = {
		enable =false,
		disable = {},
	},
	ensure_installed = {
		"tsx",
		"toml",
		"bash",
		"python",
		"javascript",
		"json",
		"jsonc",
		"yaml",
		"swift",
    "lua",
		"html",
		"scss"
	}
}
