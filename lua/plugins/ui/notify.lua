local notify = require('notify')

local icons = require('lib.icons')

notify.setup({
    background_colour = '#000',
    fps = 30,
    icons = {
        DEBUG = icons.ui.Bug,
        ERROR = icons.diagnostics.Error,
        INFO = icons.diagnostics.Information,
        TRACE = icons.ui.Bookmark,
        WARN = icons.diagnostics.Warning,
    },
    level = 2,
    render = 'default',
    stages = 'fade_in_slide_out',
    timeout = 2000,
    top_down = true,

    max_height = function()
        return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
        return math.floor(vim.o.columns * 0.75)
    end,
    on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
})

-- Controls noisy notifications
local buffered_messages = {
    'Client %d+ quit',
    'No node found at cursor',
}

local message_notifications = {}
vim.notify = function(msg, level, opts)
    opts = opts or {}
    for _, pattern in ipairs(buffered_messages) do
        if string.find(msg, pattern) then
            if message_notifications[pattern] then
                opts.replace = message_notifications[pattern]
            end

            opts.on_close = function()
                message_notifications[pattern] = nil
            end
            message_notifications[pattern] = notify.notify(msg, level, opts)
            return
        end
    end

    notify.notify(msg, level, opts)
end
