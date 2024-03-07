local onedark = require('onedark')

onedark.setup({
    style = 'deep',
    transparent = true,
    term_colors = false,
    ending_tildes = false,
    cmp_itemkind_reverse = false,

    toggle_style_key = '<leader>ct',
    toggle_style_list = { 'dark', 'darker', 'cool', 'warm', 'warmer', 'deep', 'light' },

    -- Options are italic, bold, underline, none and combos 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none',
    },

    lualine = { transparent = true },
    diagnostics = { darker = true, undercurl = true, background = false },
})
onedark.load()

-- transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
