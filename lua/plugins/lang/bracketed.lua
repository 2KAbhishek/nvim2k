local bracketed = require('mini.bracketed')

bracketed.setup({
    buffer = { suffix = 'b', options = {} },
    comment = { suffix = 'c', options = {} },
    conflict = { suffix = 'x', options = {} },
    diagnostic = { suffix = 'd', options = {} },
    file = { suffix = 'f', options = {} },
    indent = { suffix = 'i', options = {} },
    jump = { suffix = 'j', options = {} },
    location = { suffix = 'l', options = {} },
    oldfile = { suffix = 'r', options = {} },
    quickfix = { suffix = 'q', options = {} },
    treesitter = { suffix = 'n', options = {} },
    undo = { suffix = 'u', options = {} },
    window = { suffix = 'w', options = {} },
    yank = { suffix = 'y', options = {} },
})
