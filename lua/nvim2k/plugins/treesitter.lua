local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

configs.setup({
    ensure_installed = { 'help', 'lua', 'markdown' }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
                smart_rename = '<leader>Lr',
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = '<leader>Ld',
                list_definitions = '<leader>LD',
                list_definitions_toc = '<leader>Lo',
                goto_next_usage = '<leader>Lj',
                goto_previous_usage = '<leader>Lk',
            },
        },
    },

    autotag = {
        enable = true,
    },

    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
    },

    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {
            '#4688f0',
            '#98c379',
            '#e06c75',
            '#e5c07b',
            '#aa94ff',
            '#56b6c2',
            '#c678dd',
        },
    },

    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ['<leader>df'] = '@function.outer',
                ['<leader>dF'] = '@class.outer',
            },
        },
    },
})
