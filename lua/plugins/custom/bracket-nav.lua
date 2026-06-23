-- Custom native mappings for brackets navigation
local config = {
    d = { prev = vim.diagnostic.goto_prev, next = vim.diagnostic.goto_next, desc = 'Diagnostic' },
    q = { prev = '<cmd>cprev<cr>', next = '<cmd>cnext<cr>', desc = 'Quickfix' },
    Q = { prev = '<cmd>cfirst<cr>', next = '<cmd>clast<cr>', desc = 'First/Last Quickfix Item' },
    l = { prev = '<cmd>lprev<cr>', next = '<cmd>lnext<cr>', desc = 'Location Item' },
    b = { prev = '<cmd>bprev<cr>', next = '<cmd>bnext<cr>', desc = 'Buffer' },
    B = { prev = '<cmd>bfirst<cr>', next = '<cmd>blast<cr>', desc = 'First/Last Buffer' },
    w = { prev = '<C-w>p', next = '<C-w>w', desc = 'Window' },
    j = { prev = '<C-o>', next = '<C-i>', desc = 'Jump' },
}

for char, map in pairs(config) do
    vim.keymap.set('n', '[' .. char, map.prev, { desc = 'Prev ' .. map.desc })
    vim.keymap.set('n', ']' .. char, map.next, { desc = 'Next ' .. map.desc })
end

-- Insert blank lines above/below cursor without moving cursor
vim.keymap.set(
    'n',
    '[<space>',
    ":<C-u>put! =repeat(nr2char(10), v:count1)<bar>']+1<cr>",
    { silent = true, desc = 'Insert blank line above' }
)
vim.keymap.set(
    'n',
    ']<space>',
    ":<C-u>put =repeat(nr2char(10), v:count1)<bar>'[-1<cr>",
    { silent = true, desc = 'Insert blank line below' }
)

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
