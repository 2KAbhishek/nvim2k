vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use 'joshdick/onedark.vim'
  -- LSP config
  use 'neovim/nvim-lspconfig'
  -- LSP Installer
  use "williamboman/nvim-lsp-installer"
  -- LSP diagnostics
  use 'jose-elias-alvarez/null-ls.nvim'
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- statusline
  use 'nvim-lualine/lualine.nvim'
  -- devicons
  use 'kyazdani42/nvim-web-devicons'
  -- tabline
  use { 'akinsho/bufferline.nvim', tag = "v2.*" }
  -- diagnostics
  use 'folke/trouble.nvim'
  -- gitsigns
  use 'lewis6991/gitsigns.nvim'
  -- toggleterm
  use { "akinsho/toggleterm.nvim", tag = 'v2.*' }
end)
