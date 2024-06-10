local util = {}

util.get_user_config = function(key, default)
    local status_ok, user = pcall(require, 'user')
    if not status_ok then
        return default
    end

    local user_config = user[key]
    if user_config == nil then
        return default
    end
    return user_config
end

util.get_root_dir = function()
    local bufname = vim.fn.expand('%:p')
    if vim.fn.filereadable(bufname) == 0 then
        return
    end

    local parent = vim.fn.fnamemodify(bufname, ':h')
    local git_root = vim.fn.systemlist('git -C ' .. parent .. ' rev-parse --show-toplevel')
    if #git_root > 0 and git_root[1] ~= '' then
        return git_root[1]
    else
        return parent
    end
end

util.get_file_type_cmd = function(extension)
    local root = util.get_root_dir()

    if extension == 'arb' and root then
        local gemfile_exists = vim.fn.filereadable(root .. '/Gemfile') == 1
        local pubspec_exists = vim.fn.filereadable(root .. '/pubspec.yaml') == 1
        if gemfile_exists then
            return 'setfiletype ruby'
        end
        if pubspec_exists then
            return 'setfiletype json'
        end
    end
    return ''
end

util.is_present = function(bin)
    return vim.fn.executable(bin) == 1
end

util.set_transparent_bg = function()
    -- transparent background
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Terminal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Folded', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })

    -- transparent background for neotree
    vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeVertSplit', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = 'none' })

    -- transparent background for nvim-tree
    vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NvimTreeVertSplit', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'none' })
end

util.set_custom_highlights = function()
    -- set hlsearch color
    vim.api.nvim_set_hl(0, 'Search', { bg = '#8BCD5B', fg = '#202020' })
    vim.api.nvim_set_hl(0, 'CurSearch', { bg = '#EFBD5D', fg = '#000000' })
    vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#F15664', fg = '#000000' })

    -- set cursorline color
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1A1A1F' })
    vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#1A1A1F' })

    -- set visual highlight
    vim.api.nvim_set_hl(0, 'Visual', { bg = '#103070' })
end

return util
