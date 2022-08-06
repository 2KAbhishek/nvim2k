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
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
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
    -- improve load speed
    use 'lewis6991/impatient.nvim'

    -- language specific
    use 'tpope/vim-endwise' -- ruby end completion

    -- appearance
    use 'joshdick/onedark.vim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use { 'akinsho/bufferline.nvim', tag = 'v2.*' }
    use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }
    use 'lewis6991/gitsigns.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'stevearc/dressing.nvim'
    use 'lewis6991/satellite.nvim'

    -- LSP config
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'folke/trouble.nvim'
    use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
    use 'ray-x/lsp_signature.nvim'

    -- plenary, required by telescope
    use 'nvim-lua/plenary.nvim'
    -- sqlite, required by frecency
    use 'tami5/sqlite.lua'
    -- telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use 'nvim-telescope/telescope-frecency.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-symbols.nvim'
    use 'nvim-telescope/telescope-hop.nvim'

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow'
    use 'andymass/vim-matchup'

    -- Copilot
    -- use 'github/copilot.vim'
    use {
        'zbirenbaum/copilot.lua',
        event = { 'VimEnter' },
        config = function()
            vim.defer_fn(function()
                require('copilot').setup()
            end, 100)
        end,
    }

    -- cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'zbirenbaum/copilot-cmp'

    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'saadparwaiz1/cmp_luasnip'

    -- Utility
    use 'kyazdani42/nvim-tree.lua'
    use 'folke/which-key.nvim'
    use 'numToStr/Comment.nvim'
    use 'kylechui/nvim-surround'
    use 'windwp/nvim-autopairs'
    use 'rmagatti/auto-session'
    -- color highlighter
    use 'norcalli/nvim-colorizer.lua'
    -- command line completion
    use 'gelguy/wilder.nvim'
    -- refactoring
    use 'ThePrimeagen/refactoring.nvim'
    -- search and replace
    use 'windwp/nvim-spectre'
    -- bookmarks and term nav
    use 'ThePrimeagen/harpoon'
    -- tab out of braces
    use 'abecodes/tabout.nvim'
    -- movement
    use 'ggandor/leap.nvim'

    -- code runner
    use { 'michaelb/sniprun', run = 'bash ./install.sh' }
    -- Debugging
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'

    -- sync after cloneing packer.nvim
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
