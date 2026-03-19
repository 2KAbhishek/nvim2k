local treesitter = require('nvim-treesitter.configs')

local auto_install = require('lib.util').get_user_config('auto_install', true)
local installed_parsers = {}
if auto_install then
    installed_parsers = require('plugins.list').ts_parsers
end

treesitter.setup({
    ensure_installed = installed_parsers,
    auto_install = auto_install,
    sync_install = false,
    ignore_install = {},

    matchup = { enable = true },
    indent = { enable = true },

    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 500 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
})
