local function load_config(package)
    return function() require('plugins.' .. package) end
end

return {
    -- UI
    {
        'navarasu/onedark.nvim',
        config = load_config('ui.onedark'),
        lazy = false,
    },
    {
        'nvim-lualine/lualine.nvim',
        config = load_config('ui.lualine'),
        event = 'VeryLazy',
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = load_config('ui.indentline'),
        main = 'ibl',
        event = 'VeryLazy',
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        config = load_config('ui.rainbow'),
        event = 'VeryLazy',
    },
    {
        'rcarriga/nvim-notify',
        config = load_config('ui.notify'),
        event = 'VeryLazy',
        cmd = 'Notifications',
    },
    {
        'stevearc/dressing.nvim',
        config = load_config('ui.dressing'),
        event = 'VeryLazy',
    },
    {
        'uga-rosa/ccc.nvim',
        cmd = { 'CccHighlighterToggle', 'CccConvert', 'CccPick' },
    },
    {
        'glepnir/dashboard-nvim',
        config = load_config('ui.dashboard'),
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
        config = load_config('ui.wilder'),
        keys = { ':', '/', '?', },
    },
    {
        'folke/zen-mode.nvim',
        dependencies = {
            'folke/twilight.nvim',
        },
        config = load_config('ui.zen-mode'),
        cmd = { 'ZenMode', 'Twilight' },
    },

    -- Language
    { 'tpope/vim-rails',     ft = 'ruby' },
    { 'weizheheng/ror.nvim', branch = 'main',      ft = 'ruby' },
    { 'folke/neodev.nvim',   ft = { 'lua', 'vim' } },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
        },
        config = load_config('lang.dap'),
        cmd = { 'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },
    },
    {
        'nvim-neotest/neotest',
        dependencies = {
            'antoinemadec/FixCursorHold.nvim',
            'olimorris/neotest-rspec',
            'haydenmeade/neotest-jest',
        },
        config = load_config('neotest'),
        cmd = 'Neotest',
    },
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        cmd = 'SnipRun',
        config = load_config('lang.sniprun'),
    },
    {
        'ThePrimeagen/refactoring.nvim',
        config = load_config('lang.refactoring')
    },

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
        config = load_config('lang.treesitter'),
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
                config = load_config('lang.lsp-lines'),
            },
            {
                'glepnir/lspsaga.nvim',
                config = load_config('lang.lspsaga'),
            },
        },
        event = { 'VeryLazy', 'BufNewFile' },
    },
    {
        'williamboman/mason.nvim',
        config = load_config('lang.mason'),
        cmd = 'Mason',
    },
    {
        'nvimtools/none-ls.nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        config = load_config('lang.null-ls'),
        event = 'VeryLazy',
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
        config = load_config('lang.cmp'),
        event = 'InsertEnter',
    },
    {
        'zbirenbaum/copilot.lua',
        dependencies = {
            'zbirenbaum/copilot-cmp',
        },
        config = load_config('lang.copilot'),
        event = 'InsertEnter',
    },

    -- Tools
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = load_config('tools.nvim-tree'),
        cmd = 'NvimTreeToggle',
    },
    {
        'stevearc/oil.nvim',
        config = load_config('tools.oil'),
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
        config = load_config('tools.comment'),
        keys = {
            { 'gcc', mode = { 'n', }, function() require('Comment').toggle() end, desc = "Comment" },
            { 'gc',  mode = { 'v' },  function() require('Comment').toggle() end, desc = "Comment" },
        },
    },
    {
        'kylechui/nvim-surround',
        config = load_config('tools.surround'),
        keys = { 'cs', 'ds', 'ys' },
    },
    {
        'windwp/nvim-autopairs',
        config = load_config('tools.autopairs'),
        event = 'InsertEnter',
    },
    {
        'windwp/nvim-spectre',
        config = load_config('tools.spectre'),
        cmd = 'Spectre',
    },
    {
        'abecodes/tabout.nvim',
        config = load_config('tools.tabout'),
        event = 'VeryLazy',
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        config = load_config('tools.flash'),
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
        config = load_config('tools.tmux'),
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
        config = load_config('tools.spider'),
        event = 'VeryLazy',
    },
    {
        'folke/which-key.nvim',
        config = load_config('tools.which-key'),
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
        config = load_config('tools.telekasten'),
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
        config = load_config('tools.dbee'),
        cmd = 'DBToggle',
    },
    {
        'akinsho/toggleterm.nvim',
        config = load_config('tools.toggleterm'),
        cmd = { 'ToggleTerm', 'LazygitToggle', 'NodeToggle', 'PythonToggle', 'RubyToggle' },
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
        },
        cmd = 'Telescope',
        config = load_config('tools.telescope'),
    },
    {
        '2kabhishek/nerdy.nvim',
        cmd = 'Nerdy',
    },

    -- Git
    {
        '2kabhishek/co-author.nvim',
        cmd = 'GitCoAuthors',
    },
    {
        'ruifm/gitlinker.nvim',
        config = load_config('tools.gitlinker'),
        keys = '<leader>gy',
    },
    {
        'lewis6991/gitsigns.nvim',
        cmd = 'Gitsigns',
        event = 'VeryLazy',
        config = load_config('tools.gitsigns'),
    },
    {
        'tpope/vim-fugitive',
        cmd = 'Git',
    },
    {
        'pwntester/octo.nvim',
        cmd = 'Octo',
        config = load_config('tools.octo'),
        opts = true,
    },

}
