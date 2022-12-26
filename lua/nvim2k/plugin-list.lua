local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local plugins = {
    -- Appearance
    'joshdick/onedark.vim',
    'kyazdani42/nvim-web-devicons',
    'nvim-lualine/lualine.nvim',
    'akinsho/bufferline.nvim',
    'akinsho/toggleterm.nvim',
    'lewis6991/gitsigns.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'stevearc/dressing.nvim',
    'folke/zen-mode.nvim',
    'folke/twilight.nvim',

    -- LSP
    'VonHeikemen/lsp-zero.nvim',
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'folke/trouble.nvim',
    'Maan2003/lsp_lines.nvim',
    'ray-x/lsp_signature.nvim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    "glepnir/lspsaga.nvim",

    -- Completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    -- Telescope
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope.nvim', version = '0.1.0' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-telescope/telescope-hop.nvim',
    'renerocksai/telekasten.nvim',
    'renerocksai/calendar-vim',

    -- Tresitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
    'p00f/nvim-ts-rainbow',
    'andymass/vim-matchup',

    -- Utilities
    'mbbill/undotree',
    'sindrets/diffview.nvim',
    'TimUntersberger/neogit',
    'kyazdani42/nvim-tree.lua',
    'folke/which-key.nvim',
    'numToStr/Comment.nvim',
    'kylechui/nvim-surround',
    'windwp/nvim-autopairs',
    'rmagatti/auto-session',
    'norcalli/nvim-colorizer.lua',
    'gelguy/wilder.nvim',
    'ThePrimeagen/refactoring.nvim',
    'windwp/nvim-spectre',
    'ThePrimeagen/harpoon',
    'abecodes/tabout.nvim',
    'ggandor/leap.nvim',
    'tpope/vim-endwise',
    { 'michaelb/sniprun', build = 'bash ./install.sh' },
    'lewis6991/impatient.nvim',
}

require("lazy").setup(plugins)
