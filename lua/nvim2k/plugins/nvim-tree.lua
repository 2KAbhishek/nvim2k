local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
    return
end

local icons = require('nvim2k.icons')

local tree_cb = nvim_tree_config.nvim_tree_callback

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Mappings migrated from view.mappings.list
    --
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'o', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

nvim_tree.setup({
    on_attach = on_attach,
    hijack_directories = {
        enable = true,
    },
    filters = {
        -- exclude = { '.gitignore' },
    },
    update_cwd = true,
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = 'none',
        root_folder_modifier = ':t',
        indent_markers = {
            enable = false,
            icons = {
                corner = '└ ',
                edge = '│ ',
                none = '  ',
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = 'before',
            padding = ' ',
            symlink_arrow = ' ➛ ',
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = '',
                symlink = '',
                folder = {
                    arrow_open = icons.ui.ArrowOpen,
                    arrow_closed = icons.ui.ArrowClosed,
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                    symlink_open = '',
                },
                git = {
                    unstaged = '',
                    staged = '+',
                    unmerged = '',
                    renamed = '➜',
                    untracked = 'U',
                    deleted = '-',
                    ignored = '◌',
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Information,
            warning = icons.diagnostics.Warning,
            error = icons.diagnostics.Error,
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 40,
        hide_root_folder = false,
        side = 'left',
        adaptive_size = true,
        number = false,
        relativenumber = false,
    },
})
