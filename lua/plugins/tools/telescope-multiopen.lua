local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local transform_mod = require('telescope.actions.mt').transform_mod

local function multiopen(prompt_bufnr, method)
    local cmd_map = {
        vertical = 'vsplit',
        horizontal = 'split',
        tab = 'tabe',
        default = 'edit',
    }
    local picker = action_state.get_current_picker(prompt_bufnr)
    local multi_selection = picker:get_multi_selection()

    if #multi_selection > 0 then
        require('telescope.pickers').on_close_prompt(prompt_bufnr)
        pcall(vim.api.nvim_set_current_win, picker.original_win_id)

        for i, entry in ipairs(multi_selection) do
            local cmd = i == 1 and 'edit' or cmd_map[method]
            vim.cmd(string.format('%s %s', cmd, entry.value))
        end
    else
        actions['select_' .. method](prompt_bufnr)
    end
end

local custom_actions = transform_mod({
    multi_selection_open_vertical = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'vertical')
    end,
    multi_selection_open_horizontal = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'horizontal')
    end,
    multi_selection_open_tab = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'tab')
    end,
    multi_selection_open = function(prompt_bufnr)
        multiopen(prompt_bufnr, 'default')
    end,
})

local function stopinsert(callback)
    return function(prompt_bufnr)
        vim.cmd.stopinsert()
        vim.schedule(function()
            callback(prompt_bufnr)
        end)
    end
end

local multi_open_mappings = {
    i = {
        ['<C-v>'] = stopinsert(custom_actions.multi_selection_open_vertical),
        ['<C-x>'] = stopinsert(custom_actions.multi_selection_open_horizontal),
        ['<C-t>'] = stopinsert(custom_actions.multi_selection_open_tab),
        ['<CR>'] = stopinsert(custom_actions.multi_selection_open),
    },
    n = {
        ['<C-v>'] = custom_actions.multi_selection_open_vertical,
        ['<C-x>'] = custom_actions.multi_selection_open_horizontal,
        ['<C-t>'] = custom_actions.multi_selection_open_tab,
        ['<CR>'] = custom_actions.multi_selection_open,
    },
}

return multi_open_mappings
