local status_ok, which_key = pcall(require, "which-key")
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
        ["<leader>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = false, -- show help message on the command line when the popup is visible
    -- triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "j" },
        v = { "j", "j" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local m_opts = {
    mode = "n", -- NORMAL mode
    prefix = "m",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
    m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
    s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
    ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
    [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
    [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
}

local mappings = {
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["i"] = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    ["q"] = { "<cmd>q<cr>", "Quit" },
    ["Q"] = { "<cmd>qa!<cr>", "Force Quit!" },
    ["R"] = { "<cmd>lua ReloadConfig()<cr>", "Reload Neovim" },

    d = {
        name = "Debug",
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
        O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
        l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
        u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
        x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
    },

    f = {
        name = "Find",
        b = {
            "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
            "Find files",
        },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        a = {
            "<cmd>Telescope find_files find_command=fd,--hidden,-I<cr>",
            "Find All Files",
        },
        f = {
            "<cmd>Telescope git_files find_command=fd,--hidden<cr>",
            "Find files",
        },
        g = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
        l = { "<cmd>Telescope resume<cr>", "Last Search" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactor" },
        R = { "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>", "Frecent Files" },
        o = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
        s = { "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending previewer=false<cr>", "Search in file" },
        ['"'] = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        ["."] = { "<cmd>Telescope symbols<cr>", "Emojis" },
    },

    g = {
        name = "Git",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>GitBlameToggle<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Diff",
        },
        G = {
            name = "Gist",
            a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
            d = { "<cmd>Gist -d<cr>", "Delete" },
            f = { "<cmd>Gist -f<cr>", "Fork" },
            g = { "<cmd>Gist -b<cr>", "Create" },
            l = { "<cmd>Gist -l<cr>", "List" },
            p = { "<cmd>Gist -b -p<cr>", "Create Private" },
        },
    },

    l = {
        name = "LSP",
        a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
        f = { "<cmd>Lspsaga lsp_finder<cr>", "Finder" },
        h = { "<cmd>Lspsaga signature_help<cr>", "Hover" },
        j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic", },
        k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic", },
        p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
        o = { "<cmd>LSoutlineToggle<cr>", "Outline" },
        d = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
        D = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementations" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
        t = { "<cmd>TroubleToggle<cr>", "Trouble Diagnostics" },
        u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics",
        },
    },

    n = {
        name = "Notes",
        o = { "<cmd>vsplit $NOTES_ROOT<cr>", "Open Notes" },
        n = { "<cmd>execute 'vsplit $NOTES_PATH/'.strftime(\"%F\").'.md' <cr>", "New Note" },
        N = { "<cmd>execute 'e '.strftime(\"%F\").'.md' <cr>", "New Note Here" },
        z = { "<cmd>execute 'vsplit $NOTES_PATH/'.strftime(\"%F-%H-%M\").'.md' <cr>", "New Zettelkasten" },
        Z = { "<cmd>execute 'e '.strftime(\"%F-%H-%M\").'.md' <cr>", "New Zettelkasten Here" },
        d = { "<cmd>put =strftime('%F')<cr>", "Insert Date" },
        D = { "<cmd>put =strftime('%a %d %b %r')<cr>", "Insert Human Date" },
        t = { "<cmd>put =strftime('%F-%H-%M')<cr>", "Insert Time" },
        T = { "<cmd>put =strftime('%r')<cr>", "Insert Human Time" },
    },

    o = {
        name = "Session",
        s = { "<cmd>SaveSession<cr>", "Save" },
        r = { "<cmd>RestoreSession<cr>", "Restore" },
        x = { "<cmd>DeleteSession<cr>", "Delete" },
        f = { "<cmd>Autosession search<cr>", "Find" },
        d = { "<cmd>Autosession delete<cr>", "Find Delete" },
    },

    p = {
        name = "Packages",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
        m = { "<cmd>Mason<cr>", "Mason" },
    },

    r = {
        name = "Refactor",
        r = { "Rename" },
        s = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
        w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
        b = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
        e = { "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block" },
        f = { "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block To File" },
        i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
    },

    s = {
        name = "Surround",
        ["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
        a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
        d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
        r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
        q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
        b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
    },

    S = {
        name = "SnipRun",
        c = { "<cmd>SnipClose<cr>", "Close" },
        f = { "<cmd>%SnipRun<cr>", "Run File" },
        i = { "<cmd>SnipInfo<cr>", "Info" },
        m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
        r = { "<cmd>SnipReset<cr>", "Reset" },
        t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
        x = { "<cmd>SnipTerminate<cr>", "Terminate" },
    },

    t = {
        name = "Terminal",
        ["1"] = { ":1ToggleTerm<cr>", "1" },
        ["2"] = { ":2ToggleTerm<cr>", "2" },
        ["3"] = { ":3ToggleTerm<cr>", "3" },
        ["4"] = { ":4ToggleTerm<cr>", "4" },
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
        t = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        s = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },

    T = {
        name = "Treesitter",
        h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
        p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
        r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
        w = { ":write | edit | TSBufEnable :qhighlight" },
    },

    w = {
        name = "Window",
        w = { "<cmd>w<cr>", "Write" },
        W = { "<cmd>wq<cr>", "Write and Quit" },
        q = { "<cmd>bw<cr>", "Close Current Buf" },
        s = { "<cmd>split<cr>", "Horizontal Split File" },
        v = { "<cmd>vsplit<cr>", "Vertical Split File" },
        t = { "<cmd>tabnew<cr>", "New Tab" },
        o = { "<cmd>tabnext<cr>", "Only Editor" },
        O = { "<cmd>tabnext<cr>", "Only Tab" },
    },

    z = {
        name = "Zen",
        s = { "<cmd>setlocal spell!<cr>", "Toggle Spellcheck" },
        z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
        t = { "<cmd>Twilight<cr>", "Toggle Twilight" },
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
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
    ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
    s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run Code" },
    r = {
        name = "Refactor",
        e = { "<esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
        f = { "<esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract Function To File" },
        v = { "<esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
        i = { "<esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
    },
    l = {
        name = "LSP",
        a = "<cmd><C-U>Lspsaga range_code_action<CR>",
    }
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(m_mappings, m_opts)
