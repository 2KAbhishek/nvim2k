return {
    -- Appearance
    'navarasu/onedark.nvim',
    'nvim-lualine/lualine.nvim',
    'akinsho/bufferline.nvim',
    'rcarriga/nvim-notify',
    'stevearc/dressing.nvim',
    'nvim-tree/nvim-web-devicons',
    'norcalli/nvim-colorizer.lua',
    {
        'akinsho/toggleterm.nvim',
        cmd = 'ToggleTerm',
    },
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
    {
        'm4xshen/hardtime.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    },

    -- Utilities
    'nvim-tree/nvim-tree.lua',
    'stevearc/oil.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'lewis6991/gitsigns.nvim',
    'sindrets/diffview.nvim',
    'numToStr/Comment.nvim',
    'kylechui/nvim-surround',
    'windwp/nvim-autopairs',
    'ThePrimeagen/refactoring.nvim',
    'windwp/nvim-spectre',
    'ThePrimeagen/harpoon',
    'abecodes/tabout.nvim',
    'ggandor/leap.nvim',
    'aserowy/tmux.nvim',
    'NeogitOrg/neogit',
    'ruifm/gitlinker.nvim',
    'pwntester/octo.nvim',
    {
        'chrisgrieser/nvim-spider',
        lazy = true,
    },
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        lazy = true,
    },
    {
        'folke/which-key.nvim',
        lazy = true,
    },
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        cmd = 'SnipRun',
    },
    {
        '2kabhishek/co-author.nvim',
        cmd = 'GitCoAuthors',
    },
    {
        'gelguy/wilder.nvim',
        build = function()
            vim.cmd([[silent UpdateRemotePlugins]])
        end,
    },
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },
    {
        'nvim-neotest/neotest',
        lazy = true,
        dependencies = {
            'antoinemadec/FixCursorHold.nvim',
            'olimorris/neotest-rspec',
            'haydenmeade/neotest-jest',
        },
    },
    {
        'kndndrj/nvim-dbee',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require('dbee').install('curl')
        end,
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'folke/trouble.nvim',
            'Maan2003/lsp_lines.nvim',
            'ray-x/lsp_signature.nvim',
            'glepnir/lspsaga.nvim',
        },
        lazy = true,
    },
    {
        'creativenull/efmls-configs-nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
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
        event = { 'InsertEnter', 'BufRead' },
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

    {
        'zbirenbaum/copilot.lua',
        dependencies = {
            'zbirenbaum/copilot-cmp',
        },
    },
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.0',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
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
            'RRethy/nvim-treesitter-textsubjects',
            'windwp/nvim-ts-autotag',
            'HiPhish/rainbow-delimiters.nvim',
        },
        lazy = true,
    },

    -- Language specific
    { 'tpope/vim-rails', ft = 'ruby' },
    { 'weizheheng/ror.nvim', branch = 'main' },
    { 'folke/neodev.nvim' },
}
