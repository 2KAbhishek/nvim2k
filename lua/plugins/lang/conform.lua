local conform = require('conform')

conform.setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        elixir = { 'mix' },
        ruby = { 'rubocop' },
        ['_'] = { lsp_fallback = true },
    },
    format_on_save = function(bufnr)
        -- Disable autoformat if globally disabled or disabled for this buffer
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        return {
            timeout_ms = 500,
            lsp_fallback = true,
        }
    end,
})

-- Save without formatting
vim.api.nvim_create_user_command('WriteNoFormat', function()
    vim.b.disable_autoformat = true
    vim.cmd('write')
    vim.b.disable_autoformat = false
end, {})

