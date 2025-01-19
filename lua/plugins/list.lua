local util = require('lib.util')
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
    { 'nvim-tree/nvim-web-devicons' },
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        config = load_config('ui.snacks'),
    },
    {
        'nvim-lualine/lualine.nvim',
        config = load_config('ui.lualine'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'stevearc/dressing.nvim',
        config = load_config('ui.dressing'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Language
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
        'echasnovski/mini.bracketed',
        config = load_config('lang.bracketed'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'echasnovski/mini.pairs',
        config = load_config('lang.pairs'),
        event = 'InsertEnter',
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = load_config('lang.surround'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'echasnovski/mini.ai',
        version = '*',
        config = load_config('lang.ai'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'chrisgrieser/nvim-spider',
        config = load_config('lang.spider'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Tresitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-textsubjects',
        },
        config = load_config('lang.treesitter'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
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
        dependencies = { 'jay-babu/mason-null-ls.nvim' },
        config = load_config('lang.null-ls'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Completion
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '*',
        config = load_config('lang.blink'),
        opts_extend = { 'sources.default' },
        event = { 'InsertEnter' },
    },
    {
        'zbirenbaum/copilot.lua',
        dependencies = { 'giuxtaposition/blink-cmp-copilot' },
        config = load_config('lang.copilot'),
        event = 'InsertEnter',
    },
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = { 'zbirenbaum/copilot.lua' },
        branch = 'main',
        build = 'make tiktoken', -- Only on MacOS or Linux
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
        'echasnovski/mini.files',
        version = '*',
        config = load_config('tools.files'),
        event = { 'BufReadPost', 'BufNewFile' },
        keys = {
            {
                '<leader>ee',
                function()
                    require('mini.files').open(util.get_file_path(), true)
                end,
                desc = 'Explorer',
            },
        },
    },
    {
        'windwp/nvim-spectre',
        config = load_config('tools.spectre'),
        cmd = 'Spectre',
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
    },
    {
        '2kabhishek/tdo.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
        cmd = { 'Tdo', 'TdoEntry', 'TdoNote', 'TdoTodos', 'TdoToggle', 'TdoFind', 'TdoFiles' },
        keys = { '[t', ']t' },
    },
    {
        'm4xshen/hardtime.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
        cmd = 'Hardtime',
        enabled = util.get_user_config('enable_trainer', false),
    },
    {
        'kndndrj/nvim-dbee',
        dependencies = { 'MunifTanjim/nui.nvim' },
        build = function()
            --    "curl", "wget", "bitsadmin", "go"
            require('dbee').install('curl')
        end,
        config = load_config('tools.dbee'),
        cmd = 'DBToggle',
        enabled = util.get_user_config('enable_db_explorer', false),
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = { 'rcarriga/nvim-dap-ui' },
        config = load_config('tools.dap'),
        cmd = { 'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },
        enabled = util.get_user_config('enable_debugger', false),
    },
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'olimorris/neotest-rspec',
            'nvim-neotest/neotest-jest',
            'nvim-neotest/neotest-python',
        },
        config = load_config('tools.neotest'),
        cmd = 'Neotest',
        enabled = util.get_user_config('enable_test_runner', false),
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
            'debugloop/telescope-undo.nvim',
        },
        config = load_config('tools.telescope'),
        cmd = 'Telescope',
    },
    {
        -- 'chentoast/marks.nvim',
        '2kabhishek/markit.nvim',
        config = load_config('tools.marks'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        '2kabhishek/nerdy.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'Nerdy',
    },

    -- Git
    {
        '2kabhishek/co-author.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'CoAuthor',
    },
    {
        '2kabhishek/utils.nvim',
        cmd = 'UtilsClearCache',
    },
    {
        '2kabhishek/exercism.nvim',
        cmd = {
            'ExercismLanguages',
            'ExercismList',
            'ExercismSubmit',
            'ExercismTest',
        },
        keys = {
            '<leader>exa',
            '<leader>exl',
            '<leader>exs',
            '<leader>ext',
        },
        dependencies = {
            '2kabhishek/utils.nvim',
            'stevearc/dressing.nvim',
            '2kabhishek/termim.nvim',
        },
        config = load_config('tools.exercism'),
        -- opts = {},
        -- dir = '~/Projects/2KAbhishek/exercism.nvim/',
    },
    {
        '2kabhishek/octohub.nvim',
        cmd = {
            'OctoRepos',
            'OctoReposByCreated',
            'OctoReposByForks',
            'OctoReposByIssues',
            'OctoReposByLanguages',
            'OctoReposByNames',
            'OctoReposByPushed',
            'OctoReposBySize',
            'OctoReposByStars',
            'OctoReposByUpdated',
            'OctoReposTypeArchived',
            'OctoReposTypeForked',
            'OctoReposTypePrivate',
            'OctoReposTypeStarred',
            'OctoReposTypeTemplate',
            'OctoRepo',
            'OctoStats',
            'OctoActivityStats',
            'OctoContributionStats',
            'OctoRepoStats',
            'OctoProfile',
            'OctoRepoWeb',
        },
        keys = {
            '<leader>goa',
            '<leader>goA',
            '<leader>gob',
            '<leader>goc',
            '<leader>gof',
            '<leader>goF',
            '<leader>gog',
            '<leader>goi',
            '<leader>gol',
            '<leader>goo',
            '<leader>gop',
            '<leader>goP',
            '<leader>gor',
            '<leader>gos',
            '<leader>goS',
            '<leader>got',
            '<leader>goT',
            '<leader>gou',
            '<leader>goU',
            '<leader>gow',
        },
        dependencies = {
            '2kabhishek/utils.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = load_config('tools.octohub'),
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
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'tpope/vim-fugitive',
        cmd = 'Git',
    },
}

local treesitter_parsers = {
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

if util.is_present('npm') then
    table.insert(lsp_servers, 'eslint')
    table.insert(lsp_servers, 'ts_ls')
end

if util.is_present('gem') then
    table.insert(lsp_servers, 'solargraph')
    table.insert(lsp_servers, 'rubocop')
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
    table.insert(lsp_servers, 'ruff')
    table.insert(lsp_servers, 'pylsp')
end

if util.is_present('mix') then
    table.insert(lsp_servers, 'elixirls')
end

if util.is_present('cargo') then
    table.insert(lsp_servers, 'rust_analyzer')
end

vim.tbl_extend('force', plugins, util.get_user_config('user_plugins', {}))
vim.tbl_extend('force', lsp_servers, util.get_user_config('user_lsp_servers', {}))
vim.tbl_extend('force', null_ls_sources, util.get_user_config('user_null_ls_sources', {}))
vim.tbl_extend('force', treesitter_parsers, util.get_user_config('user_tresitter_parsers', {}))

return {
    plugins = plugins,
    lsp_servers = lsp_servers,
    null_ls_sources = null_ls_sources,
    ts_parsers = treesitter_parsers,
}
