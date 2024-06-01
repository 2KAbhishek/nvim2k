local flash = require('flash')
local icons = require('lib.icons')

flash.setup({
    -- exact, fuzzy, regex, custom function
    mode = 'fuzzy',
    -- behave like `incsearch`
    incremental = true,

    jump = {
        -- save location in the jumplist
        jumplist = true,
        -- automatically jump when there is only one match
        autojump = true,
    },
    label = {
        rainbow = {
            enabled = true,
            -- number between 1 and 9
            shade = 4,
        },
    },
    prompt = {
        enabled = true,
        prefix = { { icons.ui.Separator .. icons.ui.Rocket .. icons.ui.ChevronRight .. ' ', 'FlashPromptIcon' } },
        win_config = { relative = 'editor', width = 1, height = 1, row = 1, col = 0, zindex = 1000 },
    },
    modes = {
        search = {
            enabled = true,
        },
        char = {
            enabled = false,
            jump_labels = false,
        },
    },
})

vim.api.nvim_create_user_command('FlashDiagnostics', function()
    require('flash').jump({
        matcher = function(win)
            return vim.tbl_map(function(diag)
                return {
                    pos = { diag.lnum + 1, diag.col },
                    end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
                }
            end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
        end,
        action = function(match, state)
            vim.api.nvim_win_call(match.win, function()
                vim.api.nvim_win_set_cursor(match.win, match.pos)
                vim.diagnostic.open_float()
            end)
            state:restore()
        end,
    })
end, {})
