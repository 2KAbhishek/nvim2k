-- Zero-Dependency Autopairs

local self_closing_tags = {
    area = true,
    base = true,
    br = true,
    col = true,
    embed = true,
    hr = true,
    img = true,
    input = true,
    keygen = true,
    link = true,
    meta = true,
    param = true,
    source = true,
    track = true,
    wbr = true,
}

local tag_filetypes = {
    astro = true,
    heex = true,
    html = true,
    javascriptreact = true,
    jinja = true,
    markdown = true,
    php = true,
    svelte = true,
    typescriptreact = true,
    vue = true,
    xhtml = true,
    xml = true,
}

local function close_tag()
    if not tag_filetypes[vim.bo.filetype] then
        return '>'
    end
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    local before = line:sub(1, col - 1)

    local tag = before:match('<([a-zA-Z][%w%-_:]*)[^>]*$')
    if tag and not self_closing_tags[tag:lower()] and not before:find('/$') then
        local close = '</' .. tag .. '>'
        return '>' .. close .. string.rep('<Left>', #close)
    end
    return '>'
end

vim.keymap.set('i', '>', close_tag, { expr = true, silent = true, desc = 'Autoclose HTML tag' })

-- Skip over closing brackets if typed
local function close_pair(char)
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    local next_char = line:sub(col, col)
    return next_char == char and '<Right>' or char
end

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

-- Autoclose opening brackets and register skip-close helpers
local brackets = { ['('] = ')', ['['] = ']', ['{'] = '}' }
for open_char, close_char in pairs(brackets) do
    vim.keymap.set(
        'i',
        open_char,
        open_char .. close_char .. '<Left>',
        { noremap = true, silent = true, desc = 'Autoclose ' .. open_char }
    )
    vim.keymap.set('i', close_char, function()
        return close_pair(close_char)
    end, { expr = true, silent = true, desc = 'Autopair skip ' .. close_char })
end

-- Auto-close quotes
local quotes = { '"', "'", '`' }
for _, char in ipairs(quotes) do
    vim.keymap.set('i', char, function()
        return close_quote(char)
    end, { expr = true, silent = true, desc = 'Autopair ' .. char })
end

vim.keymap.set('i', '<BS>', backspace_pair, { expr = true, silent = true, desc = 'Autopair Backspace' })
