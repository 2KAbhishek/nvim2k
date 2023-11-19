local status_ok, flash = pcall(require, 'flash')
if not status_ok then
    return
end

local icons = require('lib.icons')

flash.setup({
    prompt = {
        enabled = true,
        prefix = { { icons.ui.Separator .. icons.ui.Rocket .. icons.ui.ChevronRight .. " ", "FlashPromptIcon" } },
        win_config = {
            relative = "editor",
            width = 1, -- when <=1 it's a percentage of the editor width
            height = 1,
            row = 1, -- when negative it's an offset from the bottom
            col = 0, -- when negative it's an offset from the right
            zindex = 1000,
        },
    },
    modes = {
        char = {
            jump_labels = false
        }
    }
})
