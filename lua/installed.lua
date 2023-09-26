return {
    -- Appearance
    {
        'navarasu/onedark.nvim',
        config = function()
            require('plugins.onedark')
        end,
        lazy = false,
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugins.lualine')
        end,
        event = 'BufWinEnter',
    },
    {
        'akinsho/bufferline.nvim',
        config = function()
            require('plugins.bufferline')
        end,
        event = 'BufWinEnter',
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('plugins.indentline')
        end,
        event = 'VeryLazy',
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            require('plugins.notify')
        end,
        event = 'VeryLazy',
        cmd = 'Notifications',
    },
    {
        'stevearc/dressing.nvim',
        config = function()
            require('plugins.dressing')
        end,
        event = 'VeryLazy',
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('plugins.colorizer')
        end,
        ft = { 'html', 'css', 'sass', 'javascript', 'typescriptreact', 'javascriptreact' },
        cmd = 'ColorizerToggle',
    },
    {
        'glepnir/dashboard-nvim',
        config = function()
            require('plugins.dashboard')
        end,
        -- Only load when no arguments
        event = function()
            if vim.fn.argc() == 0 then
                return 'VimEnter'
            end
        end,
        cmd = 'Dashboard',
    },
    {
        'gelguy/wilder.nvim',
        build = function()
            vim.cmd([[silent UpdateRemotePlugins]])
        end,
        config = function()
            require('plugins.wilder')
        end,
        event = 'BufWinEnter',
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

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim',
            {
                'Maan2003/lsp_lines.nvim',
                config = function()
                    require('plugins.lsp-lines')
                end,
            },
            {
                'glepnir/lspsaga.nvim',
                config = function()
                    require('plugins.lspsaga')
                end,
            },
        },
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('plugins.mason')
        end,
        cmd = 'Mason',
    },
    {
        'creativenull/efmls-configs-nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        config = function()
            require('plugins.efmls')
        end,
        event = 'BufReadPre',
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
        },
        config = function()
            require('plugins.dap')
        end,
        cmd = { 'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
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
        event = 'InsertEnter',
    },
    {
        'zbirenbaum/copilot.lua',
        dependencies = {
            'zbirenbaum/copilot-cmp',
        },
        config = function()
            require('plugins.copilot')
        end,
        event = 'InsertEnter',
    },

    -- Git
    {
        '2kabhishek/co-author.nvim',
        cmd = 'GitCoAuthors',
    },
    {
        'ruifm/gitlinker.nvim',
        config = function()
            require('plugins.gitlinker')
        end,
        keys = '<leader>gy',
    },
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
            'ThePrimeagen/harpoon',
            {
                'ThePrimeagen/refactoring.nvim',
                config = function()
                    require('plugins.refactoring')
                end,
            },
        },
        cmd = 'Telescope',
        config = function()
            require('plugins.telescope')
        end,
    },
    {
        '2kabhishek/nerdy.nvim',
        cmd = 'Nerdy',
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
    {
        'stevearc/oil.nvim',
        config = function()
            require('plugins.oil')
        end,
        cmd = 'Oil',
        -- Only load when argument is a directory
        event = function()
            if vim.fn.isdirectory(vim.fn.expand('%')) == 1 then
                return 'VimEnter'
            end
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('plugins.comment')
        end,
        keys = { 'gcc', 'gbc' },
    },
    {
        'kylechui/nvim-surround',
        config = function()
            require('plugins.surround')
        end,
        keys = { 'cs', 'ds', 'ys' },
    },
    {
        'windwp/nvim-autopairs',
        config = function()
            require('plugins.autopairs')
        end,
        event = 'InsertEnter',
    },
    {
        'windwp/nvim-spectre',
        config = function()
            require('plugins.spectre')
        end,
        cmd = 'Spectre',
    },
    {
        'abecodes/tabout.nvim',
        config = function()
            require('plugins.tabout')
        end,
        event = 'VeryLazy',
    },
    {
        'ggandor/leap.nvim',
        config = function()
            require('plugins.leap')
        end,
        keys = { 's', 'S' },
    },
    {
        'aserowy/tmux.nvim',
        config = function()
            require('plugins.tmux')
        end,
        event = 'VeryLazy',
    },
    {
        'm4xshen/hardtime.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require('hardtime').setup({ enabled = true })
        end,
        cmd = 'Hardtime',
    },
    {
        'chrisgrieser/nvim-spider',
        config = function()
            require('plugins.spider')
        end,
        event = 'VeryLazy',
    },
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
    },
    {
        'folke/which-key.nvim',
        config = function()
            require('plugins.which-key')
        end,
        event = 'BufWinEnter',
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
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = { 'markdown' },
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
    },
    {
        'renerocksai/telekasten.nvim',
        dependencies = { 'renerocksai/calendar-vim' },
        config = function()
            require('plugins.telekasten')
        end,
        cmd = 'Telekasten',
    },
    {
        'nvim-neotest/neotest',
        dependencies = {
            'antoinemadec/FixCursorHold.nvim',
            'olimorris/neotest-rspec',
            'haydenmeade/neotest-jest',
        },
        config = function()
            require('plugins.neotest')
        end,
        cmd = 'Neotest',
    },
    {
        'kndndrj/nvim-dbee',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        build = function()
            --    "curl", "wget", "bitsadmin", "go"
            require('dbee').install('curl')
        end,
        config = function()
            require('plugins.dbee')
        end,
        cmd = 'DBToggle',
    },
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('plugins.toggleterm')
        end,
        cmd = { 'ToggleTerm', 'LazygitToggle', 'NodeToggle', 'PythonToggle', 'RubyToggle' },
    },

    -- Language specific
    { 'tpope/vim-rails', ft = 'ruby' },
    { 'weizheheng/ror.nvim', branch = 'main', ft = 'ruby' },
    { 'folke/neodev.nvim', ft = { 'lua', 'vim' } },
}
