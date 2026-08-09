local lint = require('lint')

lint.linters_by_ft = {
    markdown = { 'proselint' },
    sh = { 'shellcheck' },
    bash = { 'shellcheck' },
    yaml = { 'actionlint' },
    dockerfile = { 'hadolint' },
    elixir = { 'credo' },
    ruby = { 'reek' },
    vim = { 'vint' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
    group = vim.api.nvim_create_augroup('nvim2k_lint', { clear = true }),
    callback = function()
        if vim.bo.buftype == '' then
            pcall(lint.try_lint)
        end
    end,
})
