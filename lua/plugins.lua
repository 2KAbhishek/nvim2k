
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use 'joshdick/onedark.vim'
  -- statusline
  use 'nvim-lualine/lualine.nvim'
  -- devicons
  use 'kyazdani42/nvim-web-devicons'
  -- tabline
  use {'akinsho/bufferline.nvim', tag = "v2.*"}
  -- diagnostics
  use 'folke/trouble.nvim'
  -- gitsigns
  use 'lewis6991/gitsigns.nvim'
end)
