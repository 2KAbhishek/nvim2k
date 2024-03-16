vim.opt.termguicolors = true

local ccc = require('ccc')

ccc.setup({
    highlighter = {
        auto_enable = true,
        lsp = true,
    },
})
