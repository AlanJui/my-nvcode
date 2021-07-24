--
-- Lua Language Server: https://www.reddit.com/r/neovim/comments/m2x8s8/how_to_properly_setup_lua_language_server/
--

local custom_lsp_attach = function(client)
  -- See `:help nvim_buf_set_keymap()` for more information
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  -- ... and other keymappings for LSP

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- For plugins with an `on_attach` callback, call them here. For example:
  -- require('completion').on_attach()
end


-- set the path to the sumneko installation
-- local system_name = "macOS" -- (Linux, macOS, or Windows)
-- local sumneko_root_path = '/path/to/lua-language-server'
-- local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.local/share/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/.local/share/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.local/share/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/.local/share/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                -- version = 'LuaJIT',
                version = '5.4',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                  [vim.fn.expand('$VIMRUNTIME/lua')] = true, 
                  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                },
            },
        }
    },

    on_attach = custom_lsp_attach
}


