local spider = require('spider')

spider.setup({
    skipInsignificantPunctuation = true,
})

vim.keymap.set({ 'n', 'o', 'x' }, 'w', "<cmd>lua require('spider').motion('w')<cr>", { desc = 'Spider-w' })
vim.keymap.set({ 'n', 'o', 'x' }, 'e', "<cmd>lua require('spider').motion('e')<cr>", { desc = 'Spider-e' })
vim.keymap.set({ 'n', 'o', 'x' }, 'b', "<cmd>lua require('spider').motion('b')<cr>", { desc = 'Spider-b' })
vim.keymap.set({ 'n', 'o', 'x' }, 'ge', "<cmd>lua require('spider').motion('ge')<cr>", { desc = 'Spider-ge' })
