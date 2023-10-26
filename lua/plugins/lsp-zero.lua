local status_ok, lsp_zero = pcall(require, 'lsp-zero')
if not status_ok then
    return
end

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            local custom_options = {
                enable = true,
                defaultConfig = {
                    align_continuous_assign_statement = false,
                    align_continuous_rect_table_field = false,
                    align_array_table = false
                }
            }
            lua_opts.settings.Lua.format = custom_options
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})
