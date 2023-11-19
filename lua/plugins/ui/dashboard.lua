local status_ok, dashboard = pcall(require, 'dashboard')
if not status_ok then
    return
end

local icons = require('lib.icons')

dashboard.setup({
    theme = 'hyper', --  theme is doom and hyper default is hyper
    disable_move = false, --  defualt is false disable move keymap for hyper
    shortcut_type = 'letter', --  shorcut type 'letter' or 'number'
    change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
    hide = {
        statusline = false, -- hide statusline default is true
        tabline = false, -- hide the tabline
        winbar = false, -- hide winbar
    },
    config = {
        week_header = {
            enable = true,
            append = { '', icons.ui.Circle .. ' Nvim2K: Learn. Make, Explore! ' .. icons.ui.Circle },
        },
        packages = { enable = true }, -- show how many plugins neovim loaded
        project = { enable = true, limit = 8 },
        mru = { limit = 8 },
        shortcut = {
            {
                desc = icons.ui.Package .. 'Plugins',
                group = '@property',
                action = 'Lazy',
                key = 'p',
            },
            {
                desc = icons.ui.Vim .. 'Config',
                group = '@property',
                action = 'e ~/.config/nvim/lua/plugins/list.lua',
                key = 'e',
            },
            {
                desc = icons.documents.OpenFolder .. 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
            },
            {
                desc = icons.ui.Search .. 'Search',
                group = 'Label',
                action = 'Telescope live_grep',
                key = 'g',
            },
            {
                desc = icons.ui.Check .. 'Todo',
                group = 'Label',
                action = 'Telekasten goto_today',
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
