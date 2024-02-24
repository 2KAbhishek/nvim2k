local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local action = null_ls.builtins.code_actions
local comp = null_ls.builtins.completion

-- Buily in sources: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md

null_ls.setup({
    debug = false,
    border = 'rounded',
    log_level = 'info',
    diagnostics_format = '#{c} #{m} (#{s})',
    sources = {
        action.proselint,
        action.refactoring,
        action.ts_node_action,
        comp.luasnip,
        comp.spell,
        comp.tags,
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
