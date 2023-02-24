local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        ['<leader>'] = 'SPC',
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
        border = 'rounded', -- none, single, double, shadow
        position = 'bottom', -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = 'center', -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
    show_help = false, -- show help message on the command line when the popup is visible
    -- triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { 'j', 'j' },
        v = { 'j', 'j' },
    },
}

local opts = {
    mode = 'n', -- NORMAL mode
    prefix = '<leader>',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ['e'] = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
    ['q'] = { '<cmd>q<cr>', 'Quit' },
    ['Q'] = { '<cmd>qa!<cr>', 'Force Quit!' },
    ['u'] = { '<cmd>UndotreeToggle<cr>', 'Undo Tree' },
    m = {
        name = 'Harpoon',
        a = { '<cmd>lua require("harpoon.mark").add_file()<cr>', 'Harpoon' },
        m = { '<cmd>Telescope harpoon marks<cr>', 'Search Files' },
        ['k'] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', 'Harpoon Next' },
        ['j'] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', 'Harpoon Prev' },
        ['s'] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', 'Harpoon UI' },
    },
    c = {
        name = 'Config',
        f = { '<cmd>retab<cr>', 'Fix Tabs' },
        n = { '<cmd>set relativenumber!<cr>', 'Relative Numbers' },
        r = { '<cmd>lua ReloadConfig()<cr>', 'Reload' },
        R = { '<cmd>source %<cr>', 'Source Current File' },
        s = { '<cmd>set spell!<cr>', 'Spellcheck' },
        z = { '<cmd>ZenMode<cr>', 'Toggle ZenMode' },
        t = { '<cmd>Twilight<cr>', 'Toggle Twilight' },
    },
    d = {
        name = 'Debug',
        l = { "<cmd>lua require'dap'.run_last()<cr>", 'Last' },
        u = { "<cmd>lua require'dapui'.toggle()<cr>", 'UI' },
        b = { '<cmd>DapToggleBreakpoint<cr>', 'Breakpoint' },
        c = { '<cmd>DapContinue<cr>', 'Continue' },
        i = { '<cmd>DapStepInto<cr>', 'Into' },
        o = { '<cmd>DapStepOver<cr>', 'Over' },
        O = { '<cmd>DapStepOut<cr>', 'Out' },
        r = { '<cmd>DapToggleRepl<cr>', 'Repl' },
        R = { '<cmd>DapRestartFrame<cr>', 'Repl' },
        x = { '<cmd>DapTerminate<cr>', 'Exit' },
    },
    f = {
        name = 'Find',
        b = {
            "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
            'Find files',
        },
        c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
        a = {
            '<cmd>Telescope find_files find_command=fd,--hidden,-I<cr>',
            'Find All Files',
        },
        f = {
            '<cmd>Telescope git_files find_command=fd,--hidden<cr>',
            'Find files',
        },
        g = { '<cmd>Telescope live_grep theme=ivy<cr>', 'Find Text' },
        h = { '<cmd>Telescope help_tags<cr>', 'Help' },
        i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", 'Media' },
        l = { '<cmd>Telescope resume<cr>', 'Last Search' },
        M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
        n = { '<cmd>Telescope notify theme=dropdown<CR>', 'Refactor' },
        r = { "<cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", 'Refactor' },
        R = { "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>", 'Frecent Files' },
        o = { '<cmd>Telescope oldfiles<cr>', 'Recent File' },
        s = {
            '<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending previewer=false<cr>',
            'Search in file',
        },
        ['"'] = { '<cmd>Telescope registers<cr>', 'Registers' },
        k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
        C = { '<cmd>Telescope commands<cr>', 'Commands' },
        ['.'] = { '<cmd>Telescope symbols<cr>', 'Emojis' },
    },
    g = {
        name = 'Git',
        A = { '<cmd>GitCoAuthors<cr>', 'Co Authors' },
        g = { '<cmd>lua _LAZYGIT_TOGGLE()<cr>', 'Lazygit' },
        n = { '<cmd>Neogit<cr>', 'Neogit' },
        c = { '<cmd>Neogit commit<cr>', 'Commit' },
        C = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
        j = { '<cmd>Gitsigns next_hunk<cr>', 'Next Hunk' },
        k = { '<cmd>Gitsigns prev_hunk<cr>', 'Prev Hunk' },
        p = { '<cmd>Gitsigns preview_hunk<cr>', 'Preview Hunk' },
        r = { '<cmd>Gitsigns reset_hunk<cr>', 'Reset Hunk' },
        R = { '<cmd>Gitsigns reset_buffer<cr>', 'Reset Buffer' },
        s = { '<cmd>Gitsigns stage_hunk<cr>', 'Stage Hunk' },
        S = { '<cmd>Gitsigns stage_buffer<cr>', 'Stage Hunk' },
        u = { '<cmd>Gitsigns undo_stage_hunk<cr>', 'Undo Stage Hunk' },
        o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
        b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
        d = { '<cmd>Gitsigns diffthis HEAD<cr>', 'Diff' },
        D = { '<cmd>DiffviewOpen<cr>', 'Diff View' },
        f = { '<cmd>DiffviewFileHistory<cr>', 'File History' },
        h = {
            name = '+Github',
            c = {
                name = '+Commits',
                c = { '<cmd>GHCloseCommit<cr>', 'Close' },
                e = { '<cmd>GHExpandCommit<cr>', 'Expand' },
                o = { '<cmd>GHOpenToCommit<cr>', 'Open To' },
                p = { '<cmd>GHPopOutCommit<cr>', 'Pop Out' },
                z = { '<cmd>GHCollapseCommit<cr>', 'Collapse' },
            },
            i = {
                name = '+Issues',
                p = { '<cmd>GHPreviewIssue<cr>', 'Preview' },
            },
            l = {
                name = '+Litee',
                t = { '<cmd>LTPanel<cr>', 'Toggle Panel' },
            },
            r = {
                name = '+Review',
                b = { '<cmd>GHStartReview<cr>', 'Begin' },
                c = { '<cmd>GHCloseReview<cr>', 'Close' },
                d = { '<cmd>GHDeleteReview<cr>', 'Delete' },
                e = { '<cmd>GHExpandReview<cr>', 'Expand' },
                s = { '<cmd>GHSubmitReview<cr>', 'Submit' },
                z = { '<cmd>GHCollapseReview<cr>', 'Collapse' },
            },
            p = {
                name = '+Pull Request',
                c = { '<cmd>GHClosePR<cr>', 'Close' },
                d = { '<cmd>GHPRDetails<cr>', 'Details' },
                e = { '<cmd>GHExpandPR<cr>', 'Expand' },
                o = { '<cmd>GHOpenPR<cr>', 'Open' },
                p = { '<cmd>GHPopOutPR<cr>', 'PopOut' },
                r = { '<cmd>GHRefreshPR<cr>', 'Refresh' },
                t = { '<cmd>GHOpenToPR<cr>', 'Open To' },
                z = { '<cmd>GHCollapsePR<cr>', 'Collapse' },
            },
            t = {
                name = '+Threads',
                c = { '<cmd>GHCreateThread<cr>', 'Create' },
                n = { '<cmd>GHNextThread<cr>', 'Next' },
                t = { '<cmd>GHToggleThread<cr>', 'Toggle' },
            },
        },
    },
    l = {
        name = 'LSP',
        a = { '<cmd>Lspsaga code_action<cr>', 'Code Action' },
        A = { '<cmd>lua vim.lsp.codelens.run()<cr>', 'CodeLens Action' },
        f = { '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', 'Format' },
        F = { '<cmd>Lspsaga lsp_finder<cr>', 'Finder' },
        h = { '<cmd>Lspsaga signature_help<cr>', 'Hover' },
        j = { '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Next Diagnostic' },
        k = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Prev Diagnostic' },
        p = { '<cmd>Lspsaga preview_definition<cr>', 'Preview Definition' },
        r = { '<cmd>Lspsaga rename<cr>', 'Rename' },
        o = { '<cmd>Lspsaga outline<cr>', 'Outline' },
        D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
        d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
        i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Implementations' },
        I = { '<cmd>LspInfo<cr>', 'Info' },
        l = { "<cmd>lua require('lsp_lines').toggle()<cr>", 'Toggle LSP Lines' },
        q = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', 'Quickfix' },
        R = { '<cmd>TroubleToggle lsp_references<cr>', 'References' },
        s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
        S = {
            '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
            'Workspace Symbols',
        },
        t = { '<cmd>TroubleToggle<cr>', 'Trouble Diagnostics' },
        u = { '<cmd>LuaSnipUnlinkCurrent<cr>', 'Unlink Snippet' },
        w = {
            '<cmd>Telescope lsp_workspace_diagnostics<cr>',
            'Workspace Diagnostics',
        },
    },
    n = {
        name = 'Notes',
        c = { '<cmd>Telekasten show_calendar<cr>', 'Calendar' },
        d = { '<cmd>vsplit || Telekasten goto_today<cr>', 'Daily' },
        D = { '<cmd>Telekasten find_daily_notes<cr>', 'Find Dailies' },
        f = { '<cmd>Telekasten find_notes<cr>', 'Find Notes' },
        F = { '<cmd>Telekasten follow_link<cr>', 'Follow Link' },
        g = { '<cmd>Telekasten search_notes<cr>', 'Search Notes' },
        i = { '<cmd>Telekasten insert_link<cr>', 'Insert Link' },
        t = { '<cmd>Telekasten show_tags<cr>', 'Tags' },
        n = { '<cmd>Telekasten new_note<cr>', 'New Note' },
        N = { "<cmd>execute 'e '.strftime(\"%F\").'.md' <cr>", 'New Note Here' },
        o = { '<cmd>vsplit $NOTES_ROOT<cr>', 'Open Notes' },
        p = { '<cmd>Telekasten<cr>', 'Telekasten' },
        s = { "<cmd>silent execute '!(cd $NOTES_ROOT && cmtr -b &) > /dev/null'<cr>", 'Commit Notes' },
        S = { "<cmd>silent execute '!(cd $NOTES_ROOT && cmtr -s &) > /dev/null'<cr>", 'Sync Notes' },
        w = { '<cmd>Telekasten goto_thisweek<cr>', 'Weekly' },
        W = { '<cmd>Telekasten find_weekly_notes<cr>', 'Find Weeklies' },
        v = { '<cmd>MarkdownPreviewToggle<cr>', 'Preview' },
        x = { '<cmd>Telekasten toggle_todo<cr>', 'Toggle Todo' },
        y = { '<cmd>Telekasten yank_notelink<cr>', 'Copy Note Link' },
        z = { "<cmd>execute 'vsplit $NOTES_ROOT/notes/drafts/'.strftime(\"%F-%H-%M\").'.md' <cr>", 'New Zettelkasten' },
        Z = { "<cmd>execute 'e '.strftime(\"%F-%H-%M\").'.md' <cr>", 'New Zettelkasten Here' },
        -- n = { "<cmd>execute 'vsplit $NOTES_ROOT/'.strftime(\"%F\").'.md' <cr>", "New Note" },
        -- N = { "<cmd>execute 'e '.strftime(\"%F\").'.md' <cr>", "New Note Here" },
        -- Z = { "<cmd>execute 'vsplit $NOTES_ROOT/notes/drafts/'.strftime(\"%F-%H-%M\").'.md' <cr>", "New Zettelkasten" },
        -- z = { "<cmd>execute 'e '.strftime(\"%F-%H-%M\").'.md' <cr>", "New Zettelkasten Here" },
        -- d = { "<cmd>put =strftime('%F')<cr>", "Insert Date" },
        -- D = { "<cmd>put =strftime('%a %d %b %r')<cr>", "Insert Human Date" },
        -- t = { "<cmd>put =strftime('%F-%H-%M')<cr>", "Insert Time" },
        -- T = { "<cmd>put =strftime('%r')<cr>", "Insert Human Time" },
    },
    o = {
        name = 'Session',
        s = { '<cmd>SaveSession<cr>', 'Save' },
        r = { '<cmd>RestoreSession<cr>', 'Restore' },
        x = { '<cmd>DeleteSession<cr>', 'Delete' },
        f = { '<cmd>Autosession search<cr>', 'Find' },
        d = { '<cmd>Autosession delete<cr>', 'Find Delete' },
    },
    p = {
        name = 'Packages',
        c = { '<cmd>Lazy check<cr>', 'Check' },
        d = { '<cmd>Lazy debug<cr>', 'Debug' },
        i = { '<cmd>Lazy install<cr>', 'Install' },
        l = { '<cmd>Lazy log<cr>', 'Log' },
        p = { '<cmd>Lazy profile<cr>', 'Profile' },
        r = { '<cmd>Lazy restore<cr>', 'Restore' },
        s = { '<cmd>Lazy sync<cr>', 'Sync' },
        u = { '<cmd>Lazy update<cr>', 'Update' },
        x = { '<cmd>Lazy clean<cr>', 'Clean' },
        m = { '<cmd>Mason<cr>', 'Mason' },
    },
    r = {
        name = 'Refactor',
        r = { 'Rename' },
        s = { "<cmd>lua require('spectre').open()<cr>", 'Replace' },
        w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", 'Replace Word' },
        b = { "<cmd>lua require('spectre').open_file_search()<cr>", 'Replace Buffer' },
        e = { "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", 'Extract Block' },
        f = { "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", 'Extract Block To File' },
        i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", 'Inline Variable' },
    },
    s = {
        name = 'Surround',
        ['.'] = { "<cmd>lua require('surround').repeat_last()<cr>", 'Repeat' },
        a = { "<cmd>lua require('surround').surround_add(true)<cr>", 'Add' },
        d = { "<cmd>lua require('surround').surround_delete()<cr>", 'Delete' },
        r = { "<cmd>lua require('surround').surround_replace()<cr>", 'Replace' },
        q = { "<cmd>lua require('surround').toggle_quotes()<cr>", 'Quotes' },
        b = { "<cmd>lua require('surround').toggle_brackets()<cr>", 'Brackets' },
    },
    S = {
        name = 'SnipRun',
        c = { '<cmd>SnipClose<cr>', 'Close' },
        f = { '<cmd>%SnipRun<cr>', 'Run File' },
        i = { '<cmd>SnipInfo<cr>', 'Info' },
        m = { '<cmd>SnipReplMemoryClean<cr>', 'Mem Clean' },
        r = { '<cmd>SnipReset<cr>', 'Reset' },
        t = { '<cmd>SnipRunToggle<cr>', 'Toggle' },
        x = { '<cmd>SnipTerminate<cr>', 'Terminate' },
    },
    t = {
        name = 'Terminal',
        ['1'] = { ':1ToggleTerm<cr>', '1' },
        ['2'] = { ':2ToggleTerm<cr>', '2' },
        ['3'] = { ':3ToggleTerm<cr>', '3' },
        ['4'] = { ':4ToggleTerm<cr>', '4' },
        n = { '<cmd>lua _NODE_TOGGLE()<cr>', 'Node' },
        u = { '<cmd>lua _NCDU_TOGGLE()<cr>', 'NCDU' },
        t = { '<cmd>ToggleTerm<cr>', 'ToggleTerm' },
        p = { '<cmd>lua _PYTHON_TOGGLE()<cr>', 'Python' },
        f = { '<cmd>ToggleTerm direction=float<cr>', 'Float' },
        s = { '<cmd>ToggleTerm size=10 direction=horizontal<cr>', 'Horizontal' },
        v = { '<cmd>ToggleTerm size=80 direction=vertical<cr>', 'Vertical' },
    },
    T = {
        name = 'Treesitter',
        h = { '<cmd>TSHighlightCapturesUnderCursor<cr>', 'Highlight' },
        p = { '<cmd>TSPlaygroundToggle<cr>', 'Playground' },
        r = { '<cmd>TSToggle rainbow<cr>', 'Rainbow' },
        w = { ':write | edit | TSBufEnable :qhighlight' },
    },
    w = {
        name = 'Window',
        w = { '<cmd>w<cr>', 'Write' },
        W = { "<cmd>lua require'utils'.sudo_write()<cr>", 'Force Write' },
        x = { '<cmd>x<cr>', 'Write and Quit' },
        q = { '<cmd>bw<cr>', 'Close Current Buf' },
        s = { '<cmd>split<cr>', 'Horizontal Split File' },
        v = { '<cmd>vsplit<cr>', 'Vertical Split File' },
        t = { '<cmd>tabnew<cr>', 'New Tab' },
        o = { '<cmd>tabnext<cr>', 'Only Editor' },
        O = { '<cmd>tabnext<cr>', 'Only Tab' },
    },
    -- B = {
    --     name = "Browse",
    --     i = { "<cmd>BrowseInputSearch<cr>", "Input Search" },
    --     b = { "<cmd>Browse<cr>", "Browse" },
    --     d = { "<cmd>BrowseDevdocsSearch<cr>", "Devdocs" },
    --     f = { "<cmd>BrowseDevdocsFiletypeSearch<cr>", "Devdocs Filetype" },
    --     m = { "<cmd>BrowseMdnSearch<cr>", "Mdn" },
    -- },

    -- s = {
    --   name = "Split",
    --   s = { "<cmd>split<cr>", "HSplit" },
    --   v = { "<cmd>vsplit<cr>", "VSplit" },
    -- },
}

local vopts = {
    mode = 'v', -- VISUAL mode
    prefix = '<leader>',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local vmappings = {
    ['/'] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', 'Comment' },
    s = { "<esc><cmd>'<,'>SnipRun<cr>", 'Run Code' },
    r = {
        name = 'Refactor',
        e = { "<esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>", 'Extract Function' },
        f = {
            "<esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
            'Extract Function To File',
        },
        v = { "<esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>", 'Extract Variable' },
        i = { "<esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", 'Inline Variable' },
    },
    l = {
        name = 'LSP',
        a = '<cmd><C-U>Lspsaga range_code_action<CR>',
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
