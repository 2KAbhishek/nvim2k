local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
    return
end

local get_input = function(prompt)
    local ok, result = pcall(vim.fn.input, { prompt = prompt })
    if not ok then
        return nil
    end
    return result
end

surround.setup {
    keymaps = { -- vim-surround style keymaps
        insert = "ys",
        insert_line = "yss",
        visual = "S",
        delete = "ds",
        change = "cs",
    },
    delimiters = {
        pairs = {
            ["("] = { "( ", " )" },
            [")"] = { "(", ")" },
            ["{"] = { "{ ", " }" },
            ["}"] = { "{", "}" },
            ["<"] = { "< ", " >" },
            [">"] = { "<", ">" },
            ["["] = { "[ ", " ]" },
            ["]"] = { "[", "]" },
            -- Define pairs based on function evaluations!
            ["i"] = function()
                local left_delimiter = get_input("Enter the left delimiter: ")
                if left_delimiter then
                    local right_delimiter = get_input("Enter the right delimiter: ")
                    if right_delimiter then
                        return { left_delimiter, right_delimiter }
                    end
                end
            end,
            ["f"] = function()
                local result = get_input("Enter the function name: ")
                if result then
                    return { result .. "(", ")" }
                end
            end,
        },
        separators = {
            ["'"] = { "'", "'" },
            ['"'] = { '"', '"' },
            ["`"] = { "`", "`" },
        },
        HTML = {
            ["t"] = "type", -- Change just the tag type
            ["T"] = "whole", -- Change the whole tag contents
        },
        aliases = {
            ["a"] = ">", -- Single character aliases apply everywhere
            ["b"] = ")",
            ["B"] = "}",
            ["r"] = "]",
            -- Table aliases only apply for changes/deletions
            ["q"] = { '"', "'", "`" }, -- Any quote character
            ["s"] = { ")", "]", "}", ">", "'", '"', "`" }, -- Any surrounding delimiter
        },
    },
    highlight_motion = { -- Highlight before inserting/changing surrounds
        duration = 0,
    },
}
