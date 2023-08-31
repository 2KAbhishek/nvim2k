-- Reload neovim config
function _G.ReloadConfig()
    for name, _ in pairs(package.loaded) do
        if name:match('^nvim2k') then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify('Nvim configuration reloaded!', vim.log.levels.INFO)
end

-- Copy relative path
vim.api.nvim_create_user_command('CRpath', function()
    local path = vim.fn.expand('%')
    vim.fn.setreg('+', path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Copy absolute path
vim.api.nvim_create_user_command('CApath', function()
    local path = vim.fn.expand('%:p')
    vim.fn.setreg('+', path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
