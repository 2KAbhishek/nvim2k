local ror = require('ror')
local icons = require('lib.icons')

ror.setup({
    test = {
        message = {
            file = 'Running test file...',
            line = 'Running single test...',
        },
        coverage = {
            up = 'DiffAdd',
            down = 'DiffDelete',
        },
        notification = {
            timeout = false,
        },
        pass_icon = icons.ui.Check,
        fail_icon = icons.ui.Close,
    },
})
