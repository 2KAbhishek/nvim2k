local sniprun = require('sniprun')

sniprun.setup({
    display = { 'VirtualTextOk', 'VirtualTextErr' },
    show_no_output = { 'Classic', 'TempFloatingWindow' },

    display_options = {
        terminal_width = 45,
        notification_timeout = 5,
    },

    inline_messages = 0,
    borders = 'single',
})
