-- Seamless Vim/Tmux Split Navigation
local function tmux_navigate(direction)
    local winnr = vim.fn.winnr()
    vim.cmd('wincmd ' .. direction)
    if winnr == vim.fn.winnr() and vim.env.TMUX then
        local tmux_dir = { h = 'L', j = 'D', k = 'U', l = 'R' }
        vim.fn.system('tmux select-pane -' .. tmux_dir[direction])
    end
end

vim.keymap.set('n', '<C-h>', function() tmux_navigate('h') end, { silent = true, desc = 'Tmux Navigate Left' })
vim.keymap.set('n', '<C-j>', function() tmux_navigate('j') end, { silent = true, desc = 'Tmux Navigate Down' })
vim.keymap.set('n', '<C-k>', function() tmux_navigate('k') end, { silent = true, desc = 'Tmux Navigate Up' })
vim.keymap.set('n', '<C-l>', function() tmux_navigate('l') end, { silent = true, desc = 'Tmux Navigate Right' })
