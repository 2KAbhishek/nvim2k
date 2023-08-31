local status_ok, notify = pcall(require, 'notify')
if not status_ok then
    return
end

notify.setup({
    background_colour = '#000',
    fps = 30,
    icons = {
        DEBUG = '',
        ERROR = '',
        INFO = '',
        TRACE = '✎',
        WARN = '',
    },
    level = 2,
    minimum_width = 50,
    render = 'default',
    stages = 'fade_in_slide_out',
    timeout = 2000,
    top_down = false,
})

local buffered_messages = {
    'Client %d+ quit',
}

-- Controls noisy notifications
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
