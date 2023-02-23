local plugins = {
    -- Plugin Manager, load first
    'lazy',

    -- Keybindings
    'which-key',

    -- Appearance and UI
    'onedark',
    'bufferline',
    'colorizer',
    'dressing',
    'indentline',
    'satellite',
    'specs',
    'twilight',
    'wilder',
    'zen-mode',
    'notify',

    -- Utilities
    'gitsigns',
    'diffview',
    'neogit',
    'dap',
    'harpoon',
    'leap',
    'nvim-tree',
    'sniprun',
    'telescope',
    'toggleterm',
    'treesitter-context',
    'treesitter',
    'telekasten',
    'oil',

    -- LSP Stuff
    'lsp-zero',
    'cmp',
    'null-ls',
    'lsp-lines',
    'lsp-signature',
    'lspsaga',
    'lualine',
    'trouble',

    -- Editing
    'autopairs',
    'comment',
    'refactoring',
    'spectre',
    'surround',
    'tabout',
}

local errors = {}

for _, plugin in pairs(plugins) do
    local no_errors, err_msg = pcall(require, 'nvim2k.plugins.' .. plugin)
    if not no_errors then
        table.insert(errors, err_msg)
    end
end

for _, err_msg in pairs(errors) do
    error(err_msg)
end
