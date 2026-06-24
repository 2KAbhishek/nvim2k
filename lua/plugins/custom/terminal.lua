local M = {}

M.open = function(command, position)
    -- Map legacy aliases for termim compatibility
    if position == 'split' then
        position = 'bottom'
    elseif position == 'vsplit' then
        position = 'right'
    end

    local cmd = command ~= '' and command or nil
    Snacks.terminal.toggle(cmd, { win = { position = position or 'bottom' } })
end

-- Define global package so require('termim') works for other plugins (like exercism.nvim)
package.loaded['termim'] = M

-- Register user commands
vim.api.nvim_create_user_command('Fterm', function(input)
    M.open(input.args, 'float')
end, { nargs = '*' })

vim.api.nvim_create_user_command('Sterm', function(input)
    M.open(input.args, 'bottom')
end, { nargs = '*' })

vim.api.nvim_create_user_command('STerm', function(input)
    M.open(input.args, 'top')
end, { nargs = '*' })

vim.api.nvim_create_user_command('Vterm', function(input)
    M.open(input.args, 'right')
end, { nargs = '*' })

vim.api.nvim_create_user_command('VTerm', function(input)
    M.open(input.args, 'left')
end, { nargs = '*' })

vim.api.nvim_create_user_command('Tterm', function(input)
    M.open(input.args, 'current')
end, { nargs = '*' })

return M
