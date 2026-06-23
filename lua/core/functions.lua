-- Reload neovim config
vim.api.nvim_create_user_command('ReloadConfig', function()
    for name, _ in pairs(package.loaded) do
        if name:match('^plugins') then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify('Nvim configuration reloaded!', vim.log.levels.INFO)
end, {})

local function copy_to_clipboard(content)
    vim.fn.setreg('+', content)
    vim.notify('Copied "' .. content .. '" to the clipboard!', vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('CopyRelativePath', function()
    copy_to_clipboard(vim.fn.expand('%'))
end, {})

vim.api.nvim_create_user_command('CopyAbsolutePath', function()
    copy_to_clipboard(vim.fn.expand('%:p'))
end, {})

vim.api.nvim_create_user_command('CopyRelativePathWithLine', function()
    copy_to_clipboard(vim.fn.expand('%') .. ':' .. vim.fn.line('.'))
end, {})

vim.api.nvim_create_user_command('CopyAbsolutePathWithLine', function()
    copy_to_clipboard(vim.fn.expand('%:p') .. ':' .. vim.fn.line('.'))
end, {})

vim.api.nvim_create_user_command('CopyFileName', function()
    copy_to_clipboard(vim.fn.expand('%:t'))
end, {})

-- Switch to git root or file parent dir
vim.api.nvim_create_user_command('RootDir', function()
    local root = require('lib.util').get_root_dir()

    if root == '' then
        return
    end
    vim.cmd('lcd ' .. root)
end, {})

-- Copy Git URL of current file/selection to clipboard
function CopyGitUrl(mode)
    local relative_file = vim.fn.expand('%:.')
    local repo_url = vim.fn.system('git config --get remote.origin.url'):gsub('\n', ''):gsub('%.git$', '')
    if repo_url == '' then
        vim.notify('Not a git repository', vim.log.levels.WARN)
        return
    end

    -- Convert SSH git@github.com:user/repo to HTTPS url
    repo_url = repo_url:gsub('git@github%.com:', 'https://github.com/')
    repo_url = repo_url:gsub('ssh://git@', 'https://')

    local branch = vim.fn.system('git branch --show-current'):gsub('\n', '')
    local start_line = vim.fn.line('v')
    local end_line = vim.fn.line('.')
    if mode == 'n' then
        start_line = vim.fn.line('.')
    end

    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    local url = string.format('%s/blob/%s/%s#L%d', repo_url, branch, relative_file, start_line)
    if mode == 'v' and start_line ~= end_line then
        url = string.format('%s-L%d', url, end_line)
    end
    copy_to_clipboard(url)
end

-- Runs generic git commands in the background and prints output
vim.api.nvim_create_user_command('Git', function(opts)
    local output = vim.fn.system('git ' .. opts.args)
    vim.notify(output, vim.log.levels.INFO)
end, { nargs = '*' })

-- Runner command that lazy-loads the runner module on demand
vim.api.nvim_create_user_command('Runner', function(opts)
    require('plugins.custom.runner').run(opts.line1, opts.line2)
end, { range = '%' })


