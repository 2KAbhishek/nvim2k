local Snacks = require('snacks')
local icons = require('lib.icons')

Snacks.setup({
    animate = {
        enabled = true,
        duration = 20, -- ms per step
        easing = 'linear',
        fps = 60,
    },
    bigfile = {
        enabled = true,
        notify = true,
        size = 100 * 1024, -- 100 KB
    },
    bufdelete = { enabled = true },
    dashboard = {
        enabled = true,
        sections = {
            { section = 'header' },
            {
                icon = icons.ui.Keyboard,
                title = 'Keymaps',
                section = 'keys',
                indent = 2,
                padding = 1,
            },
            {
                icon = icons.documents.File,
                title = 'Recent Files',
                section = 'recent_files',
                indent = 2,
                padding = 1,
            },
            {
                icon = icons.documents.OpenFolder,
                title = 'Projects',
                section = 'projects',
                indent = 2,
                padding = 1,
            },
            { section = 'startup' },
        },
    },
    debug = { enabled = true },
    dim = {
        enabled = true,
        scope = {
            min_size = 5,
            max_size = 20,
            siblings = true,
        },
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    indent = {
        enabled = true,
        priority = 1,
        char = icons.ui.SeparatorLight,
        only_scope = false,
        only_current = false,
        hl = {
            'SnacksIndent1',
            'SnacksIndent2',
            'SnacksIndent3',
            'SnacksIndent4',
            'SnacksIndent5',
            'SnacksIndent6',
            'SnacksIndent7',
            'SnacksIndent8',
        },
    },
    input = {
        enabled = true,
        icon = icons.ui.Edit,
        icon_hl = 'SnacksInputIcon',
        icon_pos = 'left',
        prompt_pos = 'title',
        win = { style = 'input' },
        expand = true,
    },
    lazygit = { enabled = true },
    notifier = {
        enabled = true,
        timeout = 2000,
        width = { min = 40, max = 0.4 },
        height = { min = 1, max = 0.6 },
        margin = { top = 0, right = 1, bottom = 0 },
        padding = true,
        sort = { 'level', 'added' },
        level = vim.log.levels.TRACE,
        icons = {
            debug = icons.ui.Bug,
            error = icons.diagnostics.Error,
            info = icons.diagnostics.Information,
            trace = icons.ui.Bookmark,
            warn = icons.diagnostics.Warning,
        },
        style = 'compact',
        top_down = true,
        date_format = '%R',
        more_format = ' ↓ %d lines ',
        refresh = 50,
    },
    notify = { enabled = true },
    profiler = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = {
        enabled = true,
        keys = {
            textobject = {
                ii = {
                    min_size = 2, -- minimum size of the scope
                    edge = false, -- inner scope
                    cursor = false,
                    treesitter = { blocks = { enabled = false } },
                    desc = 'inner scope',
                },
                ai = {
                    cursor = false,
                    min_size = 2, -- minimum size of the scope
                    treesitter = { blocks = { enabled = false } },
                    desc = 'full scope',
                },
            },
            jump = {
                ['[a'] = {
                    min_size = 1, -- allow single line scopes
                    bottom = false,
                    cursor = false,
                    edge = true,
                    treesitter = { blocks = { enabled = false } },
                    desc = 'jump to top edge of scope',
                },
                [']a'] = {
                    min_size = 1, -- allow single line scopes
                    bottom = true,
                    cursor = false,
                    edge = true,
                    treesitter = { blocks = { enabled = false } },
                    desc = 'jump to bottom edge of scope',
                },
            },
        },
    },
    scratch = {
        enabled = true,
        name = 'SCRATCH',
        ft = function()
            if vim.bo.buftype == '' and vim.bo.filetype ~= '' then
                return vim.bo.filetype
            end
            return 'markdown'
        end,
        icon = nil,
        root = vim.fn.stdpath('data') .. '/scratch',
        autowrite = true,
        filekey = {
            cwd = true,
            branch = true,
            count = true,
        },
        win = {
            width = 120,
            height = 40,
            bo = { buftype = '', buflisted = false, bufhidden = 'hide', swapfile = false },
            minimal = false,
            noautocmd = false,
            zindex = 20,
            wo = { winhighlight = 'NormalFloat:Normal' },
            border = 'rounded',
            title_pos = 'center',
            footer_pos = 'center',

            keys = {
                ['execute'] = {
                    '<cr>',
                    function(_)
                        vim.cmd('%SnipRun')
                    end,
                    desc = 'Execute buffer',
                    mode = { 'n', 'x' },
                },
            },
        },
        win_by_ft = {
            lua = {
                keys = {
                    ['source'] = {
                        '<cr>',
                        function(self)
                            local name = 'scratch.' .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ':e')
                            Snacks.debug.run({ buf = self.buf, name = name })
                        end,
                        desc = 'Source buffer',
                        mode = { 'n', 'x' },
                    },
                    ['execute'] = {
                        'e',
                        function(_)
                            vim.cmd('%SnipRun')
                        end,
                        desc = 'Execute buffer',
                        mode = { 'n', 'x' },
                    },
                },
            },
        },
    },
    scroll = { enabled = false },
    statuscolumn = {
        enabled = true,
        left = { 'mark', 'sign' },
        right = { 'fold', 'git' },
        folds = {
            open = false,
            git_hl = false,
        },
        git = {
            patterns = { 'GitSign', 'MiniDiffSign' },
        },
        refresh = 50,
    },
    terminal = { enabled = false },
    toggle = { enabled = false },
    win = { enabled = true },
    words = { enabled = false },
    zen = {
        enabled = true,
        toggles = {
            dim = true,
            git_signs = false,
            mini_diff_signs = false,
            -- diagnostics = false,
            -- inlay_hints = false,
        },
        show = {
            statusline = false,
            tabline = false,
        },
        win = { style = 'zen' },
        zoom = {
            toggles = {},
            show = { statusline = true, tabline = true },
            win = {
                backdrop = false,
                width = 0,
            },
        },
    },
})
