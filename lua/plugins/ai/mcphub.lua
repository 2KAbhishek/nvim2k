local mcphub = require('mcphub')

mcphub.setup({
    port = 37373,
    config = vim.fn.expand('~/.config/mcphub/servers.json'),
    native_servers = {},

    auto_approve = false,
    auto_toggle_mcp_servers = true,
    extensions = {
        avante = {
            enabled = true,
            make_slash_commands = true,
        },
    },

    ui = {
        window = {
            width = 0.8,
            height = 0.8,
            relative = 'editor',
            zindex = 50,
            border = 'rounded',
        },
        wo = {},
    },

    on_ready = function(hub) end,
    on_error = function(err) end,

    use_bundled_binary = true,

    -- server_url = nil, -- defaults to `http://localhost:port`
    shutdown_delay = 600000, -- 10 minutes
    log = {
        level = vim.log.levels.INFO,
        to_file = true,
        file_path = vim.fn.stdpath('state') .. '/mcphub.log',
        prefix = 'MCPHub',
    },
})
