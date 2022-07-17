-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Space as leader
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Telescope
keymap(
    "n",
    "<leader>ff",
    "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔎<cr>",
    opts
)

keymap(
    "n",
    "<leader>fg",
    "<cmd>Telescope live_grep<cr>",
    opts
)

keymap(
    "n",
    "<leader>fb",
    "<cmd>Telescope buffers<cr>",
    opts
)

keymap(
    "n",
    "<leader>fh",
    "<cmd>Telescope help_tags<cr>",
    opts
)

keymap(
    "n",
    "<leader>fe",
    "<cmd>Telescope file_browser <cr>",
    { noremap = true }
)

keymap(
    "n",
    "<leader>f.",
    "<cmd>Telescope symbols <cr>",
    { noremap = true }
)

keymap(
    "n",
    "<leader>fr",
    "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>",
    opts
)
