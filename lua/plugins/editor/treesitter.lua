local treesitter = require('nvim-treesitter.configs')
local textobjects = require('plugins.editor.textobjects')

local auto_install = require('lib.util').get_user_config('auto_install', true)
local installed_parsers = {}
if auto_install then
    installed_parsers = require('plugins.list').ts_parsers
end

treesitter.setup({
    ensure_installed = installed_parsers,
    sync_install = false,
    ignore_install = {},
    auto_install = true,

    textobjects = textobjects,
    matchup = { enable = true },
    indent = { enable = true },

    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
        },
    },

    textsubjects = {
        enable = true,
        prev_selection = ',',
        keymaps = {
            ['.'] = { 'textsubjects-smart', desc = 'Select the current text subject' },
            ['a;'] = {
                'textsubjects-container-outer',
                desc = 'Select outer container (class, function, etc.)',
            },
            ['i;'] = {
                'textsubjects-container-inner',
                desc = 'Select inside containers (classes, functions, etc.)',
            },
        },
    },

    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = '<leader>rr',
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = '<leader>rd',
                list_definitions = '<leader>rl',
                list_definitions_toc = '<leader>rh',
                goto_next_usage = '<leader>rj',
                goto_previous_usage = '<leader>rk',
            },
        },
    },
})
