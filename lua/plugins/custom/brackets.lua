-- Custom native mappings for brackets navigation

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })

-- Quickfix
vim.keymap.set('n', '[q', '<cmd>cprev<cr>', { desc = 'Prev Quickfix' })
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', { desc = 'Next Quickfix' })

-- Location List
vim.keymap.set('n', '[l', '<cmd>lprev<cr>', { desc = 'Prev Location Item' })
vim.keymap.set('n', ']l', '<cmd>lnext<cr>', { desc = 'Next Location Item' })

-- Buffers
vim.keymap.set('n', '[b', '<cmd>bprev<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })

-- Windows
vim.keymap.set('n', '[w', '<C-w>p', { desc = 'Prev Window' })
vim.keymap.set('n', ']w', '<C-w>w', { desc = 'Next Window' })

-- Git Conflicts (<<<<<<<, =======, >>>>>>>)
local function jump_conflict(forward)
    local flags = forward and 'W' or 'bW'
    vim.fn.search([[^\(<<<<<<<\|=======\|>>>>>>>\)]], flags)
end

vim.keymap.set('n', '[x', function()
    jump_conflict(false)
end, { desc = 'Prev Conflict' })
vim.keymap.set('n', ']x', function()
    jump_conflict(true)
end, { desc = 'Next Conflict' })

-- Jump List
vim.keymap.set('n', '[j', '<C-o>', { desc = 'Prev Jump' })
vim.keymap.set('n', ']j', '<C-i>', { desc = 'Next Jump' })

