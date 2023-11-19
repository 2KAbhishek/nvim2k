return {
    -- Appearance
    {
        'navarasu/onedark.nvim',
        config = function()
            require('plugins.ui.onedark')
        end,
        lazy = false,
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugins.ui.lualine')
        end,
        event = 'VeryLazy',
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('plugins.ui.indentline')
        end,
        main = 'ibl',
        event = 'VeryLazy',
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
            require('plugins.ui.rainbow')
        end,
        event = 'VeryLazy',
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            require('plugins.ui.notify')
        end,
        event = 'VeryLazy',
        cmd = 'Notifications',
    },
    {
        'stevearc/dressing.nvim',
        config = function()
            require('plugins.ui.dressing')
        end,
        event = 'VeryLazy',
    },
    {
        'uga-rosa/ccc.nvim',
        cmd = {'CccHighlighterToggle', 'CccConvert', 'CccPick'},
    },
    {
        'glepnir/dashboard-nvim',
        config = function()
            require('plugins.ui.dashboard')
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
            require('plugins.ui.wilder')
        end,
        keys = { ':', '/', '?', },
    },
    {
        'folke/zen-mode.nvim',
        dependencies = {
            'folke/twilight.nvim',
        },
        config = function()
            require('plugins.ui.zen-mode')
        end,
        cmd = { 'ZenMode', 'Twilight' },
    },

    -- Language

    -- Tresitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-endwise',
            'RRethy/nvim-treesitter-textsubjects',
            'windwp/nvim-ts-autotag',
        },
        lazy = true,
        config = function()
            require('plugins.lang.treesitter')
        end,
        event = 'VeryLazy',
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim',
            {
                'Maan2003/lsp_lines.nvim',
                config = function()
                    require('plugins.lang.lsp-lines')
                end,
            },
            {
                'glepnir/lspsaga.nvim',
                config = function()
                    require('plugins.lang.lspsaga')
                end,
            },
        },
        event = { 'VeryLazy', 'BufNewFile' },
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('plugins.lang.mason')
        end,
        cmd = 'Mason',
    },
    {
        'nvimtools/none-ls.nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        config = function()
            require('plugins.lang.null-ls')
        end,
        event = 'VeryLazy',
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
        },
        config = function()
            require('plugins.lang.dap')
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
            require('plugins.lang.cmp')
        end,
        event = 'InsertEnter',
    },
    {
        'zbirenbaum/copilot.lua',
        dependencies = {
            'zbirenbaum/copilot-cmp',
        },
        config = function()
            require('plugins.lang.copilot')
        end,
        event = 'InsertEnter',
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
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        cmd = 'SnipRun',
        config = function()
            require('plugins.lang.sniprun')
        end,
    },
    -- Language specific
    { 'tpope/vim-rails',     ft = 'ruby' },
    { 'weizheheng/ror.nvim', branch = 'main',      ft = 'ruby' },
    { 'folke/neodev.nvim',   ft = { 'lua', 'vim' } },

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
        event = 'VeryLazy',
        config = function()
            require('plugins.gitsigns')
        end,
    },
    {
        'tpope/vim-fugitive',
        cmd = 'Git',
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
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            'nvim-telescope/telescope-symbols.nvim',
            'molecule-man/telescope-menufacture',
            'debugloop/telescope-undo.nvim',
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
        keys = {
            { 'gcc', mode = { 'n', }, function() require('Comment').toggle() end, desc = "Comment" },
            { 'gc',  mode = { 'v' },  function() require('Comment').toggle() end, desc = "Comment" },
        },
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
        "folke/flash.nvim",
        event = "VeryLazy",
        config = function()
            require('plugins.flash')
        end,
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            {
                "S",
                mode = { "n", "x", "o" },
                function() require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc =
                "Toggle Flash Search"
            },
        },
    },
    {
        'aserowy/tmux.nvim',
        config = function()
            require('plugins.tmux')
        end,
        event = function()
            if vim.fn.exists('$TMUX') == 1 then
                return 'VeryLazy'
            end
        end,
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
        'folke/which-key.nvim',
        config = function()
            require('plugins.which-key')
        end,
        event = 'VeryLazy',
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
}
