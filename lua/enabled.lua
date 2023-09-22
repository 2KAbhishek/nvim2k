local plugins = {
    -- Plugin Manager, load first
    'lazy',
    'lsp-zero',

    -- Editing
    'autopairs',
    'refactoring',
    'spectre',
    'tabout',
    'spider',
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
