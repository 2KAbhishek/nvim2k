-- nvim-treesitter main branch configuration (compatible with Neovim 0.12+)
local ts = require('nvim-treesitter')
ts.setup()

-- Programmatically install configured parsers on startup
local auto_install = require('lib.util').get_user_config('auto_install', true)
if auto_install then
    local installed_parsers = require('plugins.list').ts_parsers
    vim.defer_fn(function() pcall(ts.install, installed_parsers) end, 0)
end

-- Cache installed & available parsers in sets for fast O(1) checks
local to_set = function(list)
    local set = {}
    for _, v in ipairs(list or {}) do set[v] = true end
    return set
end
local installed_set = ts.get_installed and to_set(ts.get_installed()) or {}
local available_set = ts.get_available and to_set(ts.get_available()) or {}

-- Handle indentation and on-the-fly auto-installation when opening files
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('TSOnOpen', { clear = true }),
    callback = function(ev)
        local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
        if not lang then return end

        if installed_set[lang] then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        elseif auto_install and available_set[lang] then
            installed_set[lang] = true -- Prevent duplicate installation triggers
            vim.schedule(function()
                local ok, task = pcall(ts.install, lang)
                if ok and task and task.await then
                    task:await(function(err)
                        if not err then
                            vim.schedule(function()
                                pcall(vim.treesitter.start)
                                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                            end)
                        end
                    end)
                end
            end)
        end
    end,
})
