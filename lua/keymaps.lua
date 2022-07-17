-- Telescope
vim.api.nvim_set_keymap(
    "n",
    "<leader>ff",
    "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔎<cr>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fg",
    "<cmd>Telescope live_grep<cr>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fb",
    "<cmd>Telescope buffers<cr>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fh",
    "<cmd>Telescope help_tags<cr>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fe",
    "<cmd>Telescope file_browser <cr>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>f.",
    "<cmd>Telescope symbols <cr>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fr",
    "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>",
    { noremap = true, silent = true }
)
