local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local format = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics
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
        comp.spell,
        comp.tags,
        diag.actionlint,
        diag.credo,
        diag.golangci_lint,
        diag.hadolint,
        diag.proselint,
        diag.reek,
        diag.rubocop,
        diag.todo_comments,
        diag.trail_space,
        diag.vint,
        diag.write_good,
        format.mix,
        format.prettier,
        format.rubocop,
        format.shfmt,
        format.stylua,
        hover.dictionary,
        hover.printenv,
    },
})

local auto_install = require('lib.util').get_user_config('auto_install', true)
local installed_sources = {}
if auto_install then
    installed_sources = require('plugins.list').null_ls_sources
end

require('mason-null-ls').setup({
    ensure_installed = installed_sources,
    automatic_installation = auto_install,
})
