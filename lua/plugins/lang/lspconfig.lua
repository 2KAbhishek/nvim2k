local lspconfig = require('lspconfig')
local icons = require('lib.icons').diagnostics

local auto_install = require('lib.util').get_user_config('auto_install', true)
local installed_servers = {}
if auto_install then
    installed_servers = require('plugins.list').lsp_servers
end

local default_setup = function(server)
    lspconfig[server].setup({
        capabilities = require('blink.cmp').get_lsp_capabilities(),
    })
end

local signs = { Error = icons.Error, Warn = icons.Warning, Hint = icons.Hint, Info = icons.Information }
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.INFO] = signs.Info,
            [vim.diagnostic.severity.HINT] = signs.Hint,
        },
    },
})

require('mason-lspconfig').setup({
    ensure_installed = installed_servers,
    handlers = {
        default_setup,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = { globals = { 'vim' } },
                        workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                        telemetry = { enable = false },
                        format = {
                            enable = true,
                            defaultConfig = {
                                align_continuous_assign_statement = false,
                                align_continuous_rect_table_field = false,
                                align_array_table = false,
                            },
                        },
                    },
                },
            })
        end,
    },
})
