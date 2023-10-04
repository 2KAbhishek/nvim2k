local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

-- Buily in sources: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md

null_ls.setup({
    debug = false,
    border = 'rounded',
    log_level = 'info',
    diagnostics_format = '#{c} #{m} (#{s})',
    sources = {
        code_actions.refactoring,
        code_actions.shellcheck,
        completion.spell,
        completion.tags,
        diagnostics.shellcheck,
        formatting.prettier,
        formatting.shfmt,
        hover.dictionary,
        hover.printenv,
        -- diagnostics.cspell.with({
        --     {
        --         disabled_filetypes = { "lua" },
        --         filetypes = { "html", "json", "yaml", "markdown" },
        --         extra_args = { "--config ~/.cspell.json" },
        --     },
        -- }),
        -- code_actions.cspell.with({
        --     {
        --         disabled_filetypes = { 'lua' },
        --         filetypes = { 'html', 'json', 'yaml', 'markdown' },
        --         extra_args = { '--config ~/.cspell.json' },
        --     },
        -- }),
    },
})
