return {
    -- Appearance
    {
        'navarasu/onedark.nvim',
        config = function()
            require('plugins.onedark')
        end,
        lazy = false,
    },
    'nvim-lualine/lualine.nvim',
    {
        'akinsho/bufferline.nvim',
        config = function()
            require('plugins.bufferline')
        end,
        event = 'BufWinEnter',
    },
    'rcarriga/nvim-notify',
    'stevearc/dressing.nvim',
    'norcalli/nvim-colorizer.lua',
    {
        'akinsho/toggleterm.nvim',
        cmd = 'ToggleTerm',
    },
    {
        'folke/zen-mode.nvim',
        dependencies = {
            'folke/twilight.nvim',
        },
        config = function()
            require('plugins.zen-mode')
        end,
        cmd = { 'ZenMode', 'Twilight' },
    },
    {
        'glepnir/dashboard-nvim',
        event = function()
            if vim.fn.argc() == 0 then
                return 'VimEnter'
            end
        end,
        config = function()
            require('plugins.dashboard')
        end,
        cmd = 'Dashboard',
    },
    {
        'm4xshen/hardtime.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require('hardtime').setup({enabled = true})
        end,
        cmd = 'Hardtime',
    },

    -- Utilities
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('plugins.nvim-tree')
        end,
        cmd = 'NvimTreeToggle',
    },
    'stevearc/oil.nvim',
    'lukas-reineke/indent-blankline.nvim',
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
    {
        'lewis6991/gitsigns.nvim',
        cmd = 'Gitsigns',
        event = 'BufWinEnter',
        config = function()
            require('plugins.gitsigns')
        end,
    },
    {
        'NeogitOrg/neogit',
        cmd = 'Neogit',
        config = function()
            require('plugins.neogit')
        end,
    },
    {
        'pwntester/octo.nvim',
        cmd = 'Octo',
        config = function()
            require('plugins.octo')
        end,
        opts = true,
    },
    {
        'ruifm/gitlinker.nvim',
        config = function()
            require('plugins.gitlinker')
        end,
        keys = '<leader>gy',
    },
    {
        'chrisgrieser/nvim-spider',
        lazy = true,
    },
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
    },
    {
        'folke/which-key.nvim',
        lazy = true,
    },
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        cmd = 'SnipRun',
        config = function()
            require('plugins.sniprun')
        end,
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
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
        ft = { 'markdown' },
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },
    {
        'renerocksai/telekasten.nvim',
        dependencies = { 'renerocksai/calendar-vim' },
        cmd = 'Telekasten',
        event = 'VeryLazy',
    },
    {
        'nvim-neotest/neotest',
        lazy = true,
        cmd = 'Neotest',
        config = function()
            require('plugins.neotest')
        end,
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
        event = 'VeryLazy',
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
            'Maan2003/lsp_lines.nvim',
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
        event = { 'InsertEnter' },
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            require('plugins.cmp')
        end,
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
            'nvim-telescope/telescope-live-grep-args.nvim',
        },
        cmd = 'Telescope',
        config = function()
            require('plugins.telescope')
        end,
    },
    -- Tresitter
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufWinEnter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-endwise',
            'RRethy/nvim-treesitter-textsubjects',
            'windwp/nvim-ts-autotag',
            'HiPhish/rainbow-delimiters.nvim',
        },
        lazy = true,
        config = function()
            require('plugins.treesitter')
        end,
    },

    -- Language specific
    { 'tpope/vim-rails', ft = 'ruby' },
    { 'weizheheng/ror.nvim', branch = 'main' },
    { 'folke/neodev.nvim' },
}
