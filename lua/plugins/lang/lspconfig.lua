local lspconfig = require('lspconfig')
local icons = require('lib.icons').diagnostics

local auto_install = require('lib.util').get_user_config('auto_install', true)
local installed_servers = {}
if auto_install then
    installed_servers = require('plugins.list').lsp_servers
end

local capabilities = require('blink.cmp').get_lsp_capabilities()
local default_setup = function(server)
    lspconfig[server].setup({
        capabilities = capabilities,
    })
end

require('mason-lspconfig').setup({
    ensure_installed = installed_servers,
    handlers = { default_setup },
})

local signs = { Error = icons.Error, Warn = icons.Warning, Hint = icons.Hint, Info = icons.Information }
vim.diagnostic.config({
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    virtual_text = true,
    float = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.INFO] = signs.Info,
            [vim.diagnostic.severity.HINT] = signs.Hint,
        },
    },
})
