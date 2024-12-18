local sniprun = require('sniprun')
local sniprun_api = require('sniprun.api')

sniprun.setup({
    display = { 'Api' },
    show_no_output = { 'Classic', 'TempFloatingWindow' },

    display_options = {
        terminal_width = 45,
        notification_timeout = 5,
    },

    inline_messages = 0,
    borders = 'single',
})

local api_listener = function(d)
    if d.status == 'ok' then
        vim.notify('Output: \n' .. d.message, vim.log.levels.INFO)
    elseif d.status == 'error' then
        vim.notify('Error: \n' .. d.message, vim.log.levels.ERROR)
    else
        vim.notify('Sniprun: ' .. d.message, vim.log.levels.INFO)
    end
end

sniprun_api.register_listener(api_listener)
