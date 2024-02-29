local status_ok, dashboard = pcall(require, 'dashboard')
if not status_ok then
    return
end

local icons = require('lib.icons')

dashboard.setup({
    theme = 'hyper',
    disable_move = false,
    shortcut_type = 'letter',
    change_to_vcs_root = true,
    hide = {
        statusline = true,
        tabline = false,
        winbar = false,
    },
    config = {
        week_header = {
            enable = true,
            append = { '', icons.ui.Circle .. ' nvim2K: Learn, Make, Explore! ' .. icons.ui.Circle },
        },
        packages = { enable = true },
        project = { enable = true, limit = 8 },
        mru = { limit = 8 },
        shortcut = {
            {
                desc = icons.ui.Package .. 'Mason',
                group = '@property',
                action = 'Mason',
                key = 'm',
            },
            {
                desc = icons.ui.Sleep .. 'Lazy',
                group = '@property',
                action = 'Lazy',
                key = 'p',
            },
            {
                desc = icons.documents.OpenFolder .. 'Files',
                group = 'Label',
                action = 'lua require("telescope").extensions.menufacture.find_files()',
                key = 'f',
            },
            {
                desc = icons.ui.Search .. 'Search',
                group = 'Label',
                action = 'lua require("telescope").extensions.menufacture.live_grep()',
                key = 'g',
            },
            {
                desc = icons.ui.Note .. 'Todo',
                group = 'Label',
                action = 'Tdo',
                key = 'd',
            },
            {
                desc = icons.ui.Power,
                group = 'Action',
                action = 'quit',
                key = 'q',
            },
        },
        footer = { '', icons.ui.Heart .. ' Happiness is a state of mind. ' .. icons.ui.Heart },
    },
})
