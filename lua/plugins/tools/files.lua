local files = require('mini.files')

files.setup({
    content = {
        filter = nil,
        prefix = nil,
        sort = nil,
    },
    mappings = {
        close = 'q',
        go_in = 'L',
        go_in_plus = 'l',
        go_out = 'h',
        go_out_plus = 'H',
        mark_goto = "'",
        mark_set = 'm',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '<CR>',
        trim_left = '<',
        trim_right = '>',
    },
    options = {
        permanent_delete = true,
        use_as_default_explorer = true,
    },
    windows = {
        max_number = math.huge,
        preview = false,
        width_focus = 30,
        width_nofocus = 20,
        width_preview = 80,
    },
})

vim.api.nvim_set_hl(0, 'MiniFilesBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'MiniFilesNormal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'MiniFilesTitle', { bg = 'none' })
