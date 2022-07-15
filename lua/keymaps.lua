vim.api.nvim_set_keymap(
  "n",
  "<Leader>e",
  ":Telescope file_browser <CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>.",
  ":Telescope symbols <cr>",
  { noremap = true }
)
