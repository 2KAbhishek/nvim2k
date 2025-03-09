local spider = require('spider')

spider.setup({
    skipInsignificantPunctuation = true,
})

vim.keymap.set({ 'n', 'o', 'x' }, 'w', ":lua require('spider').motion('w')<cr>", { desc = 'Spider-w' })
vim.keymap.set({ 'n', 'o', 'x' }, 'e', ":lua require('spider').motion('e')<cr>", { desc = 'Spider-e' })
vim.keymap.set({ 'n', 'o', 'x' }, 'b', ":lua require('spider').motion('b')<cr>", { desc = 'Spider-b' })
vim.keymap.set({ 'n', 'o', 'x' }, 'ge', ":lua require('spider').motion('ge')<cr>", { desc = 'Spider-ge' })
