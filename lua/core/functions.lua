local util = require('lib.util')
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

vim.api.nvim_create_user_command('CopyRelativePath', function()
    util.copy_to_clipboard(vim.fn.expand('%'))
end, {})

vim.api.nvim_create_user_command('CopyAbsolutePath', function()
    util.copy_to_clipboard(vim.fn.expand('%:p'))
end, {})

vim.api.nvim_create_user_command('CopyRelativePathWithLine', function()
    util.copy_to_clipboard(vim.fn.expand('%') .. ':' .. vim.fn.line('.'))
end, {})

vim.api.nvim_create_user_command('CopyAbsolutePathWithLine', function()
    util.copy_to_clipboard(vim.fn.expand('%:p') .. ':' .. vim.fn.line('.'))
end, {})

vim.api.nvim_create_user_command('CopyFileName', function()
    util.copy_to_clipboard(vim.fn.expand('%:t'))
end, {})

-- Switch to git root or file parent dir
vim.api.nvim_create_user_command('RootDir', function()
    local root = require('lib.util').get_root_dir()

    if root == '' then
        return
    end
    vim.cmd('lcd ' .. root)
end, {})

-- Copy Git URL command that lazy-loads the logic on demand
vim.api.nvim_create_user_command('CopyGitUrl', function(opts)
    local mode = (opts.range > 0) and 'v' or 'n'
    require('plugins.custom.git-url').copy(mode, opts.line1, opts.line2)
end, { range = '%' })

-- Runs generic git commands in the background and prints output
vim.api.nvim_create_user_command('Git', function(opts)
    local output = vim.fn.system('git ' .. opts.args)
    vim.notify(output, vim.log.levels.INFO)
end, { nargs = '*' })

-- Runner command that lazy-loads the runner module on demand
vim.api.nvim_create_user_command('Runner', function(opts)
    require('plugins.custom.runner').run(opts.line1, opts.line2)
end, { range = '%' })

-- Markdown preview command
vim.api.nvim_create_user_command('MDPreview', function()
    require('plugins.custom.md-preview').start()
end, {})

-- Color Highlighter toggle command
vim.api.nvim_create_user_command('ColorHighlighterToggle', function()
    require('plugins.custom.color-highlighter').toggle()
end, {})

-- Project-wide search and replace via quickfix
vim.api.nvim_create_user_command('Replace', function(opts)
    require('plugins.custom.replace').run(opts.args)
end, { nargs = '?' })
