-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Space as leader
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Use jj as escape
keymap("i", "jj", "<Esc>", opts)

-- Copy to system clipboard
keymap("v", "<leader>yy", "<cmd>!xclip -f -sel clip<cr>", opts)

-- General
keymap("n", "<leader>Q", "<cmd>qa!<cr>", opts)
keymap("n", "<leader>q", "<cmd>bw<cr>", opts)
keymap("n", "<leader>w", "<cmd>w<cr>", opts)
keymap("n", "<leader>W", "<cmd>wq<cr>", opts)
keymap("n", "<leader>r", "<cmd>source ~/.config/nvim/init.vim <cr>", opts)
keymap("n", "<leader>z", "<cmd>setlocal spell!<cr>", opts)
keymap("n", "<leader>G", "<cmd>Git<cr>", opts)
keymap("n", "<leader>i", "<cmd>Format<cr>", opts)

-- Terminal
keymap("n", "tt", "<cmd>ToggleTerm<cr>", opts)
keymap("t", "tt", "<cmd>ToggleTerm<cr>", opts)

-- Telescope
keymap("n", "<leader>ff",
    "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔎<cr>",
    opts
)
keymap("n", "<leader>fr",
    "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>",
    opts
)
keymap("n", "<leader>fs",
    "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>",
    opts
)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fe", "<cmd>Telescope file_browser <cr>", { noremap = true })
keymap("n", "<leader>f.", "<cmd>Telescope symbols <cr>", { noremap = true })

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
keymap("n", "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
