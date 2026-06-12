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
