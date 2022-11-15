local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen Neovim...'
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-list.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Appearance
    use {
        'joshdick/onedark.vim',
        'kyazdani42/nvim-web-devicons',
        'nvim-lualine/lualine.nvim',
        { 'akinsho/bufferline.nvim', tag = 'v2.*' },
        { 'akinsho/toggleterm.nvim', tag = 'v2.*' },
        'lewis6991/gitsigns.nvim',
        'lukas-reineke/indent-blankline.nvim',
        'stevearc/dressing.nvim',
        'folke/zen-mode.nvim',
        'folke/twilight.nvim'
        -- 'lewis6991/satellite.nvim',
        -- 'edluffy/specs.nvim',
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        'folke/trouble.nvim',
        -- 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        'Maan2003/lsp_lines.nvim',
        'ray-x/lsp_signature.nvim',
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
        { "glepnir/lspsaga.nvim", branch = "main" },
    }

    -- Telescope
    use {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope.nvim', tag = '0.1.0' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        'nvim-telescope/telescope-symbols.nvim',
        'nvim-telescope/telescope-hop.nvim',
    }

    -- Treesitter
    use {
        { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-context',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'windwp/nvim-ts-autotag',
        'p00f/nvim-ts-rainbow',
        'andymass/vim-matchup',
    }

    -- Copilot
    use {
        'github/copilot.vim',
        'zbirenbaum/copilot.lua',
        event = { 'VimEnter' },
        config = function()
            vim.defer_fn(function()
                require('copilot').setup()
            end, 100)
        end,
    }

    -- Completion
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'zbirenbaum/copilot-cmp',
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
        'saadparwaiz1/cmp_luasnip',
    }

    -- Utility
    use {
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
        { 'michaelb/sniprun', run = 'bash ./install.sh' },
        'lewis6991/impatient.nvim',
    }

    -- sync after cloneing packer.nvim
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
