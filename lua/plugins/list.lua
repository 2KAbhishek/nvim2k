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
        'folke/which-key.nvim',
        config = load_config('ui.which-key'),
        event = 'VeryLazy',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = load_config('ui.gitsigns'),
        cmd = 'Gitsigns',
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Editor
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        branch = 'main',
        config = load_config('editor.treesitter'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'windwp/nvim-ts-autotag',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {},
    },

    {
        'echasnovski/mini.surround',
        version = '*',
        config = load_config('editor.surround'),
        event = { 'InsertEnter' },
    },
    {
        'echasnovski/mini.ai',
        version = '*',
        config = load_config('editor.ai'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'chrisgrieser/nvim-spider',
        config = load_config('editor.spider'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Language
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = load_config('lang.lspconfig'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'stevearc/conform.nvim',
        config = load_config('lang.conform'),
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
    },
    {
        'mfussenegger/nvim-lint',
        config = load_config('lang.lint'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'williamboman/mason.nvim',
        config = load_config('lang.mason'),
        cmd = 'Mason',
    },
    {
        'saghen/blink.cmp',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        version = '*',
        config = load_config('lang.blink'),
        opts_extend = { 'sources.default' },
        event = { 'InsertEnter' },
    },

    -- Tools
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

    -- Homegrown :)
    {
        '2kabhishek/co-author.nvim',
        cmd = 'CoAuthor',
    },
    {
        '2kabhishek/nerdy.nvim',
        cmd = { 'Nerdy' },
        config = load_config('tools.nerdy'),
        keys = {
            { '<leader>in', ':Nerdy list<CR>', desc = 'Browse nerd icons' },
            { '<leader>iN', ':Nerdy recents<CR>', desc = 'Browse recent nerd icons' },
        },
    },
    {
        '2kabhishek/termim.nvim',
        cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
    },
    {
        '2kabhishek/tdo.nvim',
        cmd = { 'Tdo' },
        keys = { '<leader>nn', '<leader>nf', '<leader>nh', '<leader>nl', '<leader>nt', '<leader>nx', '[t', ']t' },
        config = load_config('tools.tdo'),
    },
    {
        '2kabhishek/octohub.nvim',
        cmd = { 'Octohub' },
        keys = { '<leader>goo' },
        dependencies = {
            '2kabhishek/utils.nvim',
        },
        config = load_config('tools.octohub'),
    },
    {
        '2kabhishek/exercism.nvim',
        cmd = { 'Exercism' },
        keys = { '<leader>exa', '<leader>exl', '<leader>exr' },
        dependencies = {
            '2kabhishek/utils.nvim',
            '2kabhishek/termim.nvim',
        },
        config = load_config('tools.exercism'),
    },
    {
        '2kabhishek/seeker.nvim',
        dependencies = { 'folke/snacks.nvim' },
        cmd = { 'Seeker' },
        keys = {
            { '<leader>fa', ':Seeker files<CR>', desc = 'Seek Files' },
            { '<leader>ff', ':Seeker git_files<CR>', desc = 'Seek Git Files' },
            { '<leader>fg', ':Seeker grep<CR>', desc = 'Seek Grep' },
            { '<leader>fw', ':Seeker grep_word<CR>', desc = 'Seek Grep Word' },
        },
        opts = {},
    },
    {
        '2kabhishek/pickme.nvim',
        cmd = 'PickMe',
        event = 'VeryLazy',
        dependencies = {
            'folke/snacks.nvim',
            -- 'nvim-telescope/telescope.nvim',
            -- 'ibhagwan/fzf-lua',
        },
        opts = {
            picker_provider = 'snacks',
        },
    },
    {
        '2kabhishek/mini.files',
        branch = 'collapse-files',
        config = load_config('tools.files'),
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
        '2kabhishek/utils.nvim',
        cmd = 'UtilsClearCache',
    },
    {
        -- '2kabhishek/template.nvim',
        -- cmd = { 'Template' },
        -- keys = { '<leader>th' },
        -- dependencies = { '2kabhishek/utils.nvim', },
        -- config = load_config('tools.template'),
        -- opts = {},
        -- dir = '~/Projects/2KAbhishek/template.nvim/',
    },
}

local treesitter_parsers = {
    'bash',
    'css',
    'gitcommit',
    'go',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'ruby',
    'rust',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
}

local lsp_servers = {
    'bashls',
    'jsonls',
    'lua_ls',
    'typos_lsp',
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

plugins = vim.tbl_extend('force', plugins, util.get_user_config('user_plugins', {}))
lsp_servers = vim.tbl_extend('force', lsp_servers, util.get_user_config('user_lsp_servers', {}))
treesitter_parsers = vim.tbl_extend('force', treesitter_parsers, util.get_user_config('user_tresitter_parsers', {}))

return {
    plugins = plugins,
    lsp_servers = lsp_servers,
    ts_parsers = treesitter_parsers,
}
