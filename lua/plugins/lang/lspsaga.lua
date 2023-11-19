local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then
    return
end

local icons = require('lib.icons')

saga.setup({
    ui = {
        -- Currently, only the round theme exists
        theme = 'round',
        -- This option only works in Neovim 0.9
        border = 'rounded',
        devicon = true,
        title = true,
        winblend = 1,
        expand = icons.ui.ArrowOpen,
        collapse = icons.ui.ArrowClosed,
        preview = icons.ui.List,
        code_action = icons.diagnostics.Hint,
        diagnostic = icons.ui.Bug,
        incoming = icons.ui.Incoming,
        outgoing = icons.ui.Outgoing,
        hover = icons.ui.Comment,
    },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>lj', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<leader>lk', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gs', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('v', '<leader>ca', '<cmd><C-U>Lspsaga range_code_action<CR>', opts)
