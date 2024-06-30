local function load_config(package)
    return function()
        require('plugins.' .. package)
    end
end

local plugins = {
    -- UI
    {
        'navarasu/onedark.nvim',
        config = load_config('ui.onedark'),
        lazy = false,
        priority = 1000,
    },
    {
        'nvim-lualine/lualine.nvim',
        config = load_config('ui.lualine'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = load_config('ui.indentline'),
        main = 'ibl',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        config = load_config('ui.rainbow'),
        event = { 'BufReadPre', 'BufNewFile' },
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
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'nvimdev/dashboard-nvim',
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
        keys = { ':', '/', '?' },
    },
    {
        'folke/zen-mode.nvim',
        dependencies = {
            'folke/twilight.nvim',
            config = load_config('ui.twilight'),
        },
        config = load_config('ui.zen-mode'),
        cmd = { 'ZenMode', 'Twilight' },
    },

    -- Language
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
            'nvim-neotest/nvim-nio',
            'olimorris/neotest-rspec',
            'haydenmeade/neotest-jest',
        },
        config = load_config('lang.neotest'),
        cmd = 'Neotest',
    },
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        config = load_config('lang.sniprun'),
        cmd = 'SnipRun',
    },
    {
        'ThePrimeagen/refactoring.nvim',
        config = load_config('lang.refactoring'),
    },
    {
        'windwp/nvim-autopairs',
        config = load_config('lang.autopairs'),
        event = 'InsertEnter',
    },
    {
        'echasnovski/mini.comment',
        version = '*',
        dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
        config = load_config('lang.comment'),
        event = { 'BufReadPre', 'BufNewFile' },
        -- enabled if anything not 0.10
        enabled = vim.fn.has('nvim-0.10.0') == 0,
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = load_config('lang.surround'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'echasnovski/mini.ai',
        version = '*',
        config = load_config('lang.ai'),
        event = { 'BufReadPre', 'BufNewFile' },
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
        config = load_config('lang.treesitter'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'ckolkey/ts-node-action',
        dependencies = { 'nvim-treesitter' },
        enabled = false,
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = load_config('lang.lspconfig'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
    },
    {
        'nvimdev/lspsaga.nvim',
        config = load_config('lang.lspsaga'),
        event = 'LspAttach',
    },
    {
        'williamboman/mason.nvim',
        config = load_config('lang.mason'),
        cmd = 'Mason',
    },
    {
        'nvimtools/none-ls.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'jay-babu/mason-null-ls.nvim' },
        config = load_config('lang.null-ls'),
        event = { 'BufReadPre', 'BufNewFile' },
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'saadparwaiz1/cmp_luasnip',
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
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        branch = 'canary',
        dependencies = {
            { 'zbirenbaum/copilot.lua' },
            { 'nvim-lua/plenary.nvim' },
        },
        cmd = {
            'CopilotChat',
            'CopilotChatToggle',
            'CopilotChatDocs',
            'CopilotChatExplain',
            'CopilotChatFix',
            'CopilotChatFixDiagnostic',
            'CopilotChatCommit',
            'CopilotChatCommitStaged',
            'CopilotChatLoad',
            'CopilotChatOptimize',
            'CopilotChatReview',
            'CopilotChatSave',
            'CopilotChatTests',
        },
        config = load_config('lang.copilot-chat'),
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
        'windwp/nvim-spectre',
        config = load_config('tools.spectre'),
        cmd = 'Spectre',
    },
    {
        'abecodes/tabout.nvim',
        config = load_config('tools.tabout'),
        event = 'InsertEnter',
    },
    {
        'folke/flash.nvim',
        config = load_config('tools.flash'),
        keys = {
            {
                's',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').jump()
                end,
                desc = 'Flash',
            },
            {
                'S',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').treesitter()
                end,
                desc = 'Flash Treesitter',
            },
        },
    },
    {
        'numToStr/Navigator.nvim',
        config = load_config('tools.navigator'),
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
        event = { 'BufReadPre', 'BufNewFile' },
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
        ft = 'markdown',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
    },
    {
        'uga-rosa/ccc.nvim',
        config = load_config('tools.ccc'),
        cmd = { 'CccHighlighterToggle', 'CccConvert', 'CccPick' },
    },
    {
        '2kabhishek/termim.nvim',
        cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
        -- dir = '~/Projects/GitHub/Maintain/termim.nvim',
    },
    {
        '2kabhishek/tdo.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
        cmd = { 'Tdo', 'TdoEntry', 'TdoNote', 'TdoTodos', 'TdoToggle', 'TdoFind', 'TdoFiles' },
        keys = { '[t', ']t' },
        -- dir = '~/Projects/GitHub/Maintain/tdo.nvim',
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
        enabled = false,
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
        },
        config = load_config('tools.telescope'),
        cmd = 'Telescope',
    },
    {
        -- 'chentoast/marks.nvim',
        '2kabhishek/markit.nvim',
        config = load_config('tools.marks'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        '2kabhishek/nerdy.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'Nerdy',
        -- dir = '~/Projects/GitHub/Maintain/nerdy.nvim',
    },

    -- Git
    {
        '2kabhishek/co-author.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'CoAuthor',
    },
    {
        'ruifm/gitlinker.nvim',
        config = load_config('tools.gitlinker'),
        keys = '<leader>yg',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = load_config('tools.gitsigns'),
        cmd = 'Gitsigns',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'tpope/vim-fugitive',
        cmd = 'Git',
    },
}

local ts_parsers = {
    'bash',
    'css',
    'dart',
    'elixir',
    'gitcommit',
    'go',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline', -- markdown code blocks
    'python',
    'ruby',
    'rust',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
}

local null_ls_sources = {
    'shellcheck', -- bash lint
}

local lsp_servers = {
    'bashls',
    'jsonls',
    'lua_ls',
    'typos_lsp', -- check typos
    'vimls',
}

local util = require('lib.util')

if util.is_present('npm') then
    table.insert(lsp_servers, 'eslint')
    table.insert(lsp_servers, 'tsserver')
end

if util.is_present('gem') then
    local ror_nvim = {
        'weizheheng/ror.nvim',
        branch = 'main',
        ft = 'ruby',
        config = load_config('lang.ror'),
        keys = {
            {
                '<leader>rc',
                mode = { 'n' },
                function()
                    vim.cmd('RorCommands')
                end,
                desc = 'Rails Commands',
            },
        },
    }
    local vim_rails = {
        'tpope/vim-rails',
        ft = 'ruby',
    }

    table.insert(lsp_servers, 'solargraph')
    -- table.insert(lsp_servers, 'ruby_lsp')
    table.insert(lsp_servers, 'rubocop')
    table.insert(plugins, ror_nvim)
    table.insert(plugins, vim_rails)
end

if util.is_present('go') then
    table.insert(lsp_servers, 'gopls')
end

if util.is_present('dart') then
    table.insert(lsp_servers, 'dartls')
end

if util.is_present('java') then
    table.insert(lsp_servers, 'jdtls')
end

if util.is_present('pip') then
    table.insert(lsp_servers, 'ruff_lsp')
    table.insert(lsp_servers, 'pylsp')
end

if util.is_present('mix') then
    table.insert(lsp_servers, 'elixirls')
end

if util.is_present('cargo') then
    table.insert(lsp_servers, 'rust_analyzer')
end

return {
    plugins = plugins,
    lsp_servers = lsp_servers,
    null_ls_sources = null_ls_sources,
    ts_parsers = ts_parsers,
}
