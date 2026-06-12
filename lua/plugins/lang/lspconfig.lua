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
    update_in_insert = false,
    severity_sort = true,
    virtual_text = {
        spacing = 4,
        source = 'if_many',
        prefix = '●',
    },
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.INFO] = signs.Info,
            [vim.diagnostic.severity.HINT] = signs.Hint,
        },
    },
    jump = {
        on_jump = function(_, _)
            vim.schedule(function()
                vim.diagnostic.open_float(nil, { scope = 'cursor' })
            end)
        end,
    },
})

-- Add rounded borders to floating LSP windows (Neovim 0.11+ compatible)
vim.lsp.handlers['textDocument/hover'] = function(err, result, ctx, config)
    config = config or {}
    config.border = 'rounded'
    return vim.lsp.handlers.hover(err, result, ctx, config)
end

vim.lsp.handlers['textDocument/signatureHelp'] = function(err, result, ctx, config)
    config = config or {}
    config.border = 'rounded'
    return vim.lsp.handlers.signature_help(err, result, ctx, config)
end
