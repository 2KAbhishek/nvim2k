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
