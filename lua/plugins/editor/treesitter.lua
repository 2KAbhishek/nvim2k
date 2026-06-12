-- nvim-treesitter main branch configuration (compatible with Neovim 0.12+)
local ts = require('nvim-treesitter')

-- Setup base installation directory
ts.setup()

-- Programmatically install configured parsers
local auto_install = require('lib.util').get_user_config('auto_install', true)
if auto_install then
    local installed_parsers = require('plugins.list').ts_parsers
    vim.defer_fn(function()
        pcall(ts.install, installed_parsers)
    end, 0)
end


-- Enable Treesitter-based Indentation for buffers with a parser
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('TSIndent', { clear = true }),
    callback = function()
        local ok_parser, parser = pcall(vim.treesitter.get_parser)
        if ok_parser and parser then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
