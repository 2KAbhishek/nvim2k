local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

local icons = require('lib.icons')

local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local mode_color = {
    n = colors.green,
    i = colors.blue,
    v = colors.magenta,
    [''] = colors.magenta,
    V = colors.magenta,
    c = colors.yellow,
    t = colors.red,
    R = colors.orange,
    Rv = colors.orange,
    no = colors.fg,
    s = colors.violet,
    S = colors.violet,
    [''] = colors.violet,
    ic = colors.yellow,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!'] = colors.red,
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local searchcount = { 'searchcount', color = { fg = colors.fg, gui = 'bold' } }
local selectioncount = { 'selectioncount', color = { fg = colors.fg, gui = 'bold' } }
local progress = { 'progress', color = { fg = colors.fg, gui = 'bold' } }

local filesize = {
    'filesize',
    color = { fg = colors.fg, gui = 'bold' },
    cond = conditions.buffer_not_empty,
}

local filetype = {
    'filetype',
    color = { fg = colors.blue, gui = 'bold' },
}

local fileformat = {
    'fileformat',
    icons_enabled = true,
    color = { fg = colors.white, gui = 'bold' },
}

local filename = {
    'filename',
    fmt = function(str)
        return str:sub(1, 16)
    end,
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
}

local branch = {
    'branch',
    icon = icons.git.Branch,
    fmt = function(str)
        return str:sub(1, 32)
    end,
    color = { fg = colors.green, gui = 'bold' },
}

local diff_icons = {
    'diff',
    symbols = { added = icons.git.Add, modified = icons.git.Mod, removed = icons.git.Remove },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

local diagnostics = {
    'diagnostics',
    sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic' },
    symbols = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warning,
        info = icons.diagnostics.Information,
        hint = icons.diagnostics.Hint,
    },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.blue },
        color_hint = { fg = colors.yellow },
    },
}

local lsp = {
    function()
        local msg = 'No LSP'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = icons.ui.Gear,
    color = { fg = colors.fg, gui = 'bold' },
}

local encoding = {
    'o:encoding',
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
}

local separator = {
    function()
        return icons.ui.Separator
    end,
    color = function()
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 0, right = 0 },
}

local function mode(icon)
    icon = icon or icons.ui.NeoVim
    return {
        function()
            return icon
        end,
        color = function()
            return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { left = 1, right = 0 },
    }
end

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        -- section_separators = '',
        theme = 'onedark',
        disabled_filetypes = {
            'dashboard',
        },
    },
    -- extensions = { 'quickfix', 'man', 'mason', 'lazy', 'toggleterm', 'nvim-tree' },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_c = { separator, mode(icons.ui.Heart), 'location', filename, diff_icons, diagnostics },
        lualine_x = { searchcount, selectioncount, branch, lsp, progress, filesize, filetype, fileformat, encoding,
            separator },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        lualine_a = {},
        lualine_b = { mode(), { 'buffers', use_mode_colors = true } },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'tabs' },
        lualine_z = {}
    },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
