local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

local textobjects = require('plugins.lang.textobjects')

configs.setup({
    ensure_installed = { 'vimdoc', 'lua', 'markdown' }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { '' }, -- List of parsers to ignore installing
    auto_install = true,

    autopairs = {
        enable = true,
    },

    endwise = {
        enable = true,
    },

    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { '' }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
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

    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
        },
        highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = '<leader>ler',
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = '<leader>led',
                list_definitions = '<leader>leD',
                list_definitions_toc = '<leader>leo',
                goto_next_usage = '<leader>lej',
                goto_previous_usage = '<leader>lek',
            },
        },
    },

    autotag = {
        enable = true,
    },

    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
    },

    textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = { 'textsubjects-smart', desc = "Select the current text subject" },
            ['a;'] = { 'textsubjects-container-outer', desc = "Select outer container (class, function, etc.)" },
            ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
        },
    },
    textobjects = textobjects,
})
