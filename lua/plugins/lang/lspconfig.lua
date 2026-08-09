local lspconfig = require('lspconfig')
local icons = require('lib.icons')
local diag_icons = icons.diagnostics

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

local signs =
    { Error = diag_icons.Error, Warn = diag_icons.Warning, Hint = diag_icons.Hint, Info = diag_icons.Information }
vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    virtual_text = {
        spacing = 4,
        source = 'if_many',
        prefix = icons.ui.CircleSmall,
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

-- Add rounded borders to floating LSP hover & signature help (Neovim 0.12+ compatible)
local orig_hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function(opts)
    opts = vim.tbl_extend('force', { border = 'rounded' }, opts or {})
    return orig_hover(opts)
end

local orig_signature_help = vim.lsp.buf.signature_help
vim.lsp.buf.signature_help = function(opts)
    opts = vim.tbl_extend('force', { border = 'rounded' }, opts or {})
    return orig_signature_help(opts)
end
