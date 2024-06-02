local marks = require('marks')
local icons = require('lib.icons')

marks.setup({
    default_mappings = true,
    builtin_marks = { '.', '<', '>', '^' },
    cyclic = true,
    force_write_shada = false,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    excluded_filetypes = {},
    excluded_buftypes = { 'nofile' },
    -- supports up to 10 bookmark groups
    bookmark_1 = {
        sign = icons.ui.Flag,
        virt_text = 'flag',
        annotate = false,
    },
    bookmark_2 = {
        sign = icons.ui.Eye,
        virt_text = 'watch',
        annotate = false,
    },
    bookmark_3 = {
        sign = icons.ui.Star,
        virt_text = 'star',
        annotate = false,
    },
    bookmark_4 = {
        sign = icons.ui.Bug,
        virt_text = 'bug',
        annotate = false,
    },
    mappings = {
        set = 'M',
        toggle_mark = 'm',
    },
})
