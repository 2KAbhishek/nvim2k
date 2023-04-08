return {
    -- Appearance
    'navarasu/onedark.nvim',
    'nvim-lualine/lualine.nvim',
    'akinsho/bufferline.nvim',
    'rcarriga/nvim-notify',
    'stevearc/dressing.nvim',
    'nvim-tree/nvim-web-devicons',
    'norcalli/nvim-colorizer.lua',
    { 'akinsho/toggleterm.nvim', cmd = 'ToggleTerm' },
    {
        'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        lazy = true,
        dependencies = {
            'folke/twilight.nvim',
        },
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
    },

    -- Utilities
    'nvim-tree/nvim-tree.lua',
    'stevearc/oil.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'lewis6991/gitsigns.nvim',
    'sindrets/diffview.nvim',
    'TimUntersberger/neogit',
    'numToStr/Comment.nvim',
    'kylechui/nvim-surround',
    'windwp/nvim-autopairs',
    'gelguy/wilder.nvim',
    'ThePrimeagen/refactoring.nvim',
    'windwp/nvim-spectre',
    'ThePrimeagen/harpoon',
    'abecodes/tabout.nvim',
    'ggandor/leap.nvim',
    'aserowy/tmux.nvim',
    { 'ldelossa/gh.nvim', dependencies = { 'ldelossa/litee.nvim' } },
    { 'mbbill/undotree', cmd = 'UndotreeToggle', lazy = true },
    { 'folke/which-key.nvim', lazy = true },
    { 'michaelb/sniprun', build = 'bash ./install.sh', cmd = 'SnipRun' },
    { '2kabhishek/co-author.nvim', cmd = 'GitCoAuthors' },
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'folke/trouble.nvim',
            'Maan2003/lsp_lines.nvim',
            'ray-x/lsp_signature.nvim',
            'glepnir/lspsaga.nvim',
        },
        lazy = true,
    },

    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
        },
        cmd = 'DapToggleBreakpoint',
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.0',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-symbols.nvim',
            'nvim-telescope/telescope-hop.nvim',
            'renerocksai/telekasten.nvim',
            'renerocksai/calendar-vim',
        },
        lazy = true,
    },

    -- Tresitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-endwise',
            'windwp/nvim-ts-autotag',
            'p00f/nvim-ts-rainbow',
        },
        lazy = true,
    },

    -- Language specific
    { 'tpope/vim-rails', ft = 'ruby' },
    { 'weizheheng/ror.nvim', branch = 'main' },
}
