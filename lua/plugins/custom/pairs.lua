-- Zero-Dependency Autopairs

-- Autoclose opening brackets
vim.keymap.set('i', '(', '()<Left>', { noremap = true, silent = true, desc = 'Autoclose (' })
vim.keymap.set('i', '[', '[]<Left>', { noremap = true, silent = true, desc = 'Autoclose [' })
vim.keymap.set('i', '{', '{}<Left>', { noremap = true, silent = true, desc = 'Autoclose {' })

-- Skip over closing brackets if typed
local function close_pair(char)
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    local next_char = line:sub(col, col)
    return next_char == char and '<Right>' or char
end

vim.keymap.set('i', ')', function() return close_pair(')') end, { expr = true, silent = true, desc = 'Autopair skip )' })
vim.keymap.set('i', ']', function() return close_pair(']') end, { expr = true, silent = true, desc = 'Autopair skip ]' })
vim.keymap.set('i', '}', function() return close_pair('}') end, { expr = true, silent = true, desc = 'Autopair skip }' })

-- Smart quotes: close/skip and handle text contractions (e.g. don't, I'll)
local function close_quote(char)
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    local next_char = line:sub(col, col)
    if next_char == char then
        return '<Right>'
    end
    if char == "'" and col > 1 and line:sub(col - 1, col - 1):match('[a-zA-Z0-9]') then
        return "'"
    end
    return char .. char .. '<Left>'
end

vim.keymap.set('i', '"', function() return close_quote('"') end, { expr = true, silent = true, desc = 'Autopair "' })
vim.keymap.set('i', "'", function() return close_quote("'") end, { expr = true, silent = true, desc = "Autopair '" })
vim.keymap.set('i', '`', function() return close_quote('`') end, { expr = true, silent = true, desc = 'Autopair `' })

-- Smart backspace (deletes pair if cursor is inside an empty bracket/quote)
local function backspace_pair()
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    if col > 1 then
        local prev_char = line:sub(col - 1, col - 1)
        local next_char = line:sub(col, col)
        local pairs = { ['('] = ')', ['['] = ']', ['{'] = '}', ['"'] = '"', ["'"] = "'", ['`'] = '`' }
        if pairs[prev_char] == next_char then
            return '<BS><Delete>'
        end
    end
    return '<BS>'
end

vim.keymap.set('i', '<BS>', backspace_pair, { expr = true, silent = true, desc = 'Autopair Backspace' })
