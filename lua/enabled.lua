local plugins = {
    -- Plugin Manager, load first
    'lazy',

    -- Keybindings
    'which-key',

    -- Appearance and UI
    'onedark',
    'dashboard',
    'bufferline',
    'colorizer',
    'dressing',
    'indentline',
    'satellite',
    'twilight',
    'wilder',
    'zen-mode',
    'notify',

    -- Utilities
    'neogit',
    'gitsigns',
    'octo',
    'gitlinker',
    'diffview',
    'tmux',
    'dap',
    'leap',
    'neotest',
    'nvim-tree',
    'sniprun',
    'telescope',
    'toggleterm',
    'treesitter-context',
    'treesitter',
    'telekasten',
    'oil',
    'dbee',

    -- LSP Stuff
    'mason',
    'lsp-zero',
    'copilot',
    'cmp',
    'lsp-lines',
    'lsp-signature',
    'lspsaga',
    'lualine',
    'efmls',

    -- Editing
    'autopairs',
    'comment',
    'refactoring',
    'spectre',
    'surround',
    'tabout',
    'spider',
    'hardtime',
    'ror',
    'neodev',
}

local errors = {}
local error_plugins = {}

for _, plugin in pairs(plugins) do
    local ok, err_msg = pcall(require, 'plugins.' .. plugin)
    if not ok then
        table.insert(errors, err_msg)
        table.insert(error_plugins, plugin)
    end
end

for i, err_msg in pairs(errors) do
    vim.notify(err_msg, vim.log.levels.ERROR, {
        title = 'Error loading : ' .. error_plugins[i],
    })
end
