local markit = require('markit')
local icons = require('lib.icons')

markit.setup({
    add_default_keybindings = true,
    builtin_marks = { '.', '<', '>', '^' },
    cyclic = true,
    force_write_shada = false,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    excluded_filetypes = {},
    excluded_buftypes = { 'nofile' },
    bookmarks = {
        { sign = icons.ui.Neovim, virt_text = 'flag', annotate = false },
        { sign = icons.ui.Eye, virt_text = 'watch', annotate = false },
        { sign = icons.ui.Star, virt_text = 'star', annotate = false },
        { sign = icons.ui.Bug, virt_text = 'bug', annotate = false },
    },
})
