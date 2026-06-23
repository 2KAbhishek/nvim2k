-- Color Highlighter Verification Sandbox
-- Run :ColorHighlighterToggle to toggle highlights for these colors:
-- Hex: #ff007f (Neon Pink), #00f3ff (Electric Cyan), #39ff14 (Lime Green), #ff5500 (Hot Orange), #ffd700 (Gold)
-- Short Hex: #f0f (Magenta), #0ff (Cyan), #ff0 (Yellow), #f00 (Red), #0f0 (Green), #00f (Blue)
-- Hex with Alpha (ignored alpha): #ff007fff (Full Pink), #00f3ffaa (Semi Cyan)
-- RGB: rgb(255, 0, 127) (Bright Rose), rgb(57, 255, 20) (Neon Lime), rgb(0, 229, 255) (Aqua)
-- RGBA: rgba(255, 110, 64, 0.9) (Sunset Coral), rgba(124, 77, 255, 0.8) (Neon Violet)
-- HSL: hsl(300, 100%, 50%) (Fuchsia), hsl(60, 100%, 50%) (Yellow), hsl(200, 100%, 50%) (Sky Blue)
-- HSLA: hsla(340, 100%, 50%, 0.8) (Crimson), hsla(150, 100%, 50%, 0.5) (Emerald)

local M = {}
local ns_id = vim.api.nvim_create_namespace('hex_color_highlighter')
local enabled = false
local group = nil
local defined_highlights = {}

-- Helper to expand 3-digit and 4-digit shorthand hex color codes, and strip alpha
local function expand_hex(hex)
    local r, g, b = hex:match('^#(%x)(%x)(%x)%x?$')
    if r then
        return '#' .. r .. r .. g .. g .. b .. b
    end
    local r2, g2, b2 = hex:match('^#(%x%x)(%x%x)(%x%x)%x%x$')
    if r2 then
        return '#' .. r2 .. g2 .. b2
    end
    return hex
end

-- Helper to convert RGB to Hex
local function rgb_to_hex(r, g, b)
    local r_num = math.min(255, math.max(0, tonumber(r) or 255))
    local g_num = math.min(255, math.max(0, tonumber(g) or 255))
    local b_num = math.min(255, math.max(0, tonumber(b) or 255))
    return string.format('#%02x%02x%02x', r_num, g_num, b_num)
end

-- Helper to convert HSL to Hex
local function hsl_to_rgb(h, s_str, l_str)
    local h_num = (tonumber(h) or 0) / 360
    local s_num = (tonumber(s_str:match('%d+')) or 0) / 100
    local l_num = (tonumber(l_str:match('%d+')) or 0) / 100

    local r, g, b
    if s_num == 0 then
        r, g, b = l_num, l_num, l_num
    else
        local function hue_to_rgb(p, q, t)
            if t < 0 then
                t = t + 1
            end
            if t > 1 then
                t = t - 1
            end
            if t < 1 / 6 then
                return p + (q - p) * 6 * t
            end
            if t < 1 / 2 then
                return q
            end
            if t < 2 / 3 then
                return p + (q - p) * (2 / 3 - t) * 6
            end
            return p
        end

        local q = l_num < 0.5 and l_num * (1 + s_num) or l_num + s_num - l_num * s_num
        local p = 2 * l_num - q
        r = hue_to_rgb(p, q, h_num + 1 / 3)
        g = hue_to_rgb(p, q, h_num)
        b = hue_to_rgb(p, q, h_num - 1 / 3)
    end

    return string.format(
        '#%02x%02x%02x',
        math.floor(r * 255 + 0.5),
        math.floor(g * 255 + 0.5),
        math.floor(b * 255 + 0.5)
    )
end

-- Helper to determine text contrast (returns black or white hex string)
local function get_contrast(hex)
    local r, g, b = hex:match('#(%x%x)(%x%x)(%x%x)')
    local r_num, g_num, b_num = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)
    local luminance = 0.299 * r_num + 0.587 * g_num + 0.114 * b_num
    return luminance > 130 and '#000000' or '#ffffff'
end

-- Helper to scan line and add matches to table using a pattern and parser function
local function add_matches(line, pattern, parser_fn, matches)
    local start_pos = 1
    while true do
        local s, e = line:find(pattern, start_pos)
        if not s then
            break
        end

        local word = line:sub(s, e)
        local hex = parser_fn(word)
        if hex then
            table.insert(matches, {
                start_col = s - 1,
                end_col = e,
                hex = hex,
            })
        end
        start_pos = e + 1
    end
end

-- Find all color matches in a line
local function find_colors(line)
    local matches = {}

    -- 1. Match hex colors: # followed by hex digits (3 to 8 digits)
    add_matches(line, '#%x+', function(word)
        local len = #word
        return (len == 9 or len == 7 or len == 5 or len == 4) and expand_hex(word) or nil
    end, matches)

    -- 2. Match rgb/rgba colors
    add_matches(line, 'rgba?%s*%([%s%d%.,]+%)', function(word)
        local r, g, b = word:match('rgba?%s*%(%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)')
        return r and rgb_to_hex(r, g, b) or nil
    end, matches)

    -- 3. Match hsl/hsla colors
    add_matches(line, 'hsla?%s*%([%s%d%.,%%]+%)', function(word)
        local h, s, l = word:match('hsla?%s*%(%s*(%d+)%s*,%s*(%d+%%)%s*,%s*(%d+%%)')
        return h and hsl_to_rgb(h, s, l) or nil
    end, matches)

    return matches
end

-- Clear and re-highlight colors in the buffer
function M.highlight_buffer(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    if not vim.api.nvim_buf_is_valid(bufnr) then
        return
    end

    -- Skip extremely large buffers to avoid typing lag
    local line_count = vim.api.nvim_buf_line_count(bufnr)
    if line_count > 10000 then
        return
    end

    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for i, line in ipairs(lines) do
        local line_idx = i - 1
        local matches = find_colors(line)
        for _, match in ipairs(matches) do
            local hex = match.hex
            local fg = get_contrast(hex)
            local hl_name = 'HexColor_' .. hex:gsub('#', '')

            if not defined_highlights[hl_name] then
                vim.api.nvim_set_hl(0, hl_name, { bg = hex, fg = fg })
                defined_highlights[hl_name] = true
            end

            vim.api.nvim_buf_add_highlight(bufnr, ns_id, hl_name, line_idx, match.start_col, match.end_col)
        end
    end
end

function M.toggle()
    enabled = not enabled
    if enabled then
        -- Register autocommands when enabled
        group = vim.api.nvim_create_augroup('ColorHighlighter', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWinEnter', 'TextChanged', 'TextChangedI' }, {
            group = group,
            callback = function(args)
                if enabled then
                    M.highlight_buffer(args.buf)
                end
            end,
        })
        M.highlight_buffer()
        vim.notify('Color highlights enabled', vim.log.levels.INFO)
    else
        -- Unregister autocommands and clear namespace
        if group then
            pcall(vim.api.nvim_del_augroup_by_id, group)
            group = nil
        end
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_valid(bufnr) then
                vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
            end
        end
        vim.notify('Color highlights disabled', vim.log.levels.INFO)
    end
end

return M
