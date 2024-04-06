local copilot = require('copilot')

copilot.setup({
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
        },
        layout = {
            position = 'bottom',
            ratio = 0.4,
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
            accept = '<M-l>',
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
        },
    },
    filetypes = {
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        ['.'] = true,
    },
    copilot_node_command = 'node', -- Node.js version must be > 16.x
    server_opts_overrides = {},
})

require('copilot_cmp').setup()
