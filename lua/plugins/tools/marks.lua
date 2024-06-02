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
    -- supports up to 10 bookmark groups, easily open group of files
    bookmark_0 = {
        sign = icons.ui.Flag,
        virt_text = 'group-0',
        annotate = false,
    },
    bookmark_1 = {
        sign = icons.ui.Eye,
        virt_text = 'watch',
        annotate = false,
    },
    mappings = {},
})
