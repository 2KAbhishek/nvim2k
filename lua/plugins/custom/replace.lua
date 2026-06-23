local M = {}

-- Helper to find a delimiter that is not present in search or replace strings
local function get_delimiter(find, replace)
    local delimiters = { '/', '#', '@', '_', '~', ';' }
    for _, d in ipairs(delimiters) do
        if not find:find(d, 1, true) and not replace:find(d, 1, true) then
            return d
        end
    end
    return '/' -- fallback
end

function M.run(find)
    if find == nil or find == '' then
        find = vim.fn.input('Find: ')
    end
    if find == '' then
        return
    end

    local replace = vim.fn.input('Replace with: ')

    -- Populate quickfix list using Ripgrep
    local grep_cmd = 'rg --vimgrep --smart-case ' .. vim.fn.shellescape(find)
    local output = vim.fn.system(grep_cmd)
    if vim.v.shell_error ~= 0 or output == '' then
        vim.notify('No matches found for: ' .. find, vim.log.levels.WARN)
        return
    end

    -- Load results into quickfix
    local lines = {}
    for s in output:gmatch('[^\r\n]+') do
        table.insert(lines, s)
    end
    vim.fn.setqflist({}, 'r', { title = 'Search: ' .. find, lines = lines })

    local original_buf = vim.api.nvim_get_current_buf()
    vim.cmd('copen')

    -- Pick a safe delimiter for the substitution command to handle slashes in paths
    local d = get_delimiter(find, replace)

    -- Prompt user for confirmation mode
    local choice = vim.fn.confirm('Replace all occurrences?', '&Yes\n&Confirm each\n&Cancel', 1)
    if choice == 1 then
        -- Replace all instantly across all files and update
        local cmd = string.format('cfdo %%s%s%s%s%s%sg | update', d, find, d, replace, d)
        local success, err = pcall(vim.cmd, cmd)
        if success then
            pcall(vim.api.nvim_set_current_buf, original_buf)
            vim.notify('Replaced all occurrences of "' .. find .. '" with "' .. replace .. '"', vim.log.levels.INFO)
        else
            vim.notify('Replacement failed: ' .. tostring(err), vim.log.levels.ERROR)
        end
    elseif choice == 2 then
        -- Pre-populate the command line for manual step-by-step confirmation
        local replace_cmd = string.format('cfdo %%s%s%s%s%s%sgc | update', d, find, d, replace, d)
        vim.api.nvim_feedkeys(':' .. replace_cmd, 'n', false)
    end
end

return M
