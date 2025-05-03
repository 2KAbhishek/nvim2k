local gitsigns = require('gitsigns')
local icons = require('lib.icons')

gitsigns.setup({
    signs = {
        add = { text = icons.ui.SeparatorLight },
        change = { text = icons.ui.SeparatorLight },
        delete = { text = icons.ui.SeparatorLight },
        topdelete = { text = icons.ui.Topline },
        changedelete = { text = icons.ui.SeparatorLight },
        untracked = { text = icons.ui.SeparatorDashed },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = { interval = 1000, follow_files = true },
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 0,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = { border = 'rounded', style = 'minimal', relative = 'cursor', row = 0, col = 1 },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']e', function()
            if vim.wo.diff then
                return ']e'
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return '<Ignore>'
        end, { expr = true, desc = 'Next Change' })

        map('n', '[e', function()
            if vim.wo.diff then
                return '[e'
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return '<Ignore>'
        end, { expr = true, desc = 'Prev Change' })

        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<cr>')
    end,
})
