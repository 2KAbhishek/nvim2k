local null_ls = require('null-ls')

local action = null_ls.builtins.code_actions
local comp = null_ls.builtins.completion
local diag = null_ls.builtins.diagnostics
local format = null_ls.builtins.formatting
local hover = null_ls.builtins.hover

-- Buily in sources: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup({
    debug = false,
    border = 'rounded',
    log_level = 'info',
    diagnostics_format = '#{c} #{m} (#{s})',
    sources = {
        action.proselint, -- markdown actions
        action.refactoring,
        -- action.ts_node_action, -- treesitter node actions, buggy, causes repeated notifications
        comp.spell, -- spell completion
        comp.tags, -- tags completion
        diag.actionlint, -- github action lint
        diag.credo, -- elixir diagnostics
        diag.golangci_lint,
        diag.hadolint, -- docker lint
        diag.proselint, -- markdown lint
        diag.reek, -- ruby code smell
        -- diag.rubocop, -- ruby diagnostics
        -- diag.todo_comments, -- causes highlighter errors on J
        diag.trail_space, -- trailing space check
        diag.vint, -- vim lint
        diag.write_good, -- english writing style
        format.mix, -- elixir formatter
        format.prettier, -- js, md, css, etc formatter
        -- format.rubocop, -- ruby formatter
        format.shfmt, -- shell formatter
        format.stylua, -- lua formatter
        hover.dictionary, -- show word dictionary on hover
        hover.printenv, -- show env on hover
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
