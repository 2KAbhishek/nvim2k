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

return util
