-- Native code runner module for executing entire files or visual selections
local M = {}

-- Helper to run code internally and notify the user of results/errors
local function run_internal(name, execute_fn)
    local success, result = pcall(execute_fn)
    if success then
        local out = (type(result) == 'table' and result.output) or result
        out = (out ~= nil and out ~= '') and tostring(out) or 'Executed successfully'
        vim.notify(out, vim.log.levels.INFO, { title = name .. ' Output' })
    else
        vim.notify(tostring(result), vim.log.levels.ERROR, { title = name .. ' Error' })
    end
end

function M.run(line1, line2)
    local ft = vim.bo.filetype
    -- Define interpreters for each supported filetype
    local interpreters = {
        python = 'python3',
        ruby = 'ruby',
        lua = 'lua',
        javascript = 'node',
        typescript = 'ts-node',
        sh = 'bash',
        bash = 'bash',
        go = 'go run',
        elixir = 'elixir',
        java = 'java',
    }

    -- Extract visual selection or entire file buffer content
    local lines = vim.api.nvim_buf_get_lines(0, line1 - 1, line2, false)
    local code = table.concat(lines, '\n')

    -- Execute Lua files/selections internally to support Neovim API calls
    if ft == 'lua' then
        local chunk, compile_err = load(code)
        if not chunk then
            vim.notify(compile_err or 'Failed to load Lua code', vim.log.levels.ERROR, { title = 'Lua Compile Error' })
            return
        end
        run_internal('Lua', chunk)
        return
    end

    -- Execute Vimscript files/selections internally
    if ft == 'vim' then
        run_internal('Vimscript', function()
            return vim.api.nvim_exec2(code, { output = true })
        end)
        return
    end

    local interpreter = interpreters[ft]
    if not interpreter then
        vim.notify('No interpreter configured for filetype: ' .. ft, vim.log.levels.WARN)
        return
    end

    -- Resolve command execution source (direct file run vs stdin pipeline)
    local cmd_table = {}
    for _, part in ipairs(vim.split(interpreter, ' ')) do
        table.insert(cmd_table, part)
    end

    local input = nil
    if line1 == 1 and line2 == vim.api.nvim_buf_line_count(0) then
        local filepath = vim.fn.expand('%:p')
        if filepath ~= '' and vim.bo.modified == false then
            table.insert(cmd_table, filepath)
        else
            input = code
        end
    else
        input = code
    end

    -- Execute external interpreters asynchronously to avoid blocking Neovim UI
    vim.system(cmd_table, { stdin = input }, function(obj)
        vim.schedule(function()
            if obj.code == 0 then
                local output = obj.stdout
                if output == '' then
                    output = 'Executed successfully (no output)'
                end
                vim.notify(output, vim.log.levels.INFO, { title = 'Output' })
            else
                local err = obj.stderr
                if err == '' then
                    err = obj.stdout
                end
                vim.notify(err, vim.log.levels.ERROR, { title = 'Error (code ' .. obj.code .. ')' })
            end
        end)
    end)
end

return M
