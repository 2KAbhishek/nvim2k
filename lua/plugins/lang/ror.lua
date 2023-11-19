local status_ok, ror = pcall(require, 'ror')
if not status_ok then
    return
end

local icons = require('lib.icons')

ror.setup({
    test = {
        message = {
            -- These are the default title for nvim-notify
            file = 'Running test file...',
            line = 'Running single test...',
        },
        coverage = {
            -- To customize replace with the hex color you want for the highlight
            -- guibg=#354a39
            up = 'DiffAdd',
            -- guibg=#4a3536
            down = 'DiffDelete',
        },
        notification = {
            -- Using timeout false will replace the progress notification window
            -- Otherwise, the progress and the result will be a different notification window
            timeout = false,
        },
        pass_icon = icons.ui.Check,
        fail_icon = icons.ui.Close,
    },
})
