local flash = require('flash')
local icons = require('lib.icons')

flash.setup({
    prompt = {
        enabled = true,
        prefix = { { icons.ui.Separator .. icons.ui.Rocket .. icons.ui.ChevronRight .. ' ', 'FlashPromptIcon' } },
        win_config = { relative = 'editor', width = 1, height = 1, row = 1, col = 0, zindex = 1000 },
    },
    modes = {
        char = {
            jump_labels = false,
        },
    },
})
