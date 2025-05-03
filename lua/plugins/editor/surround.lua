local surround = require('mini.surround')

surround.setup({
    custom_surroundings = nil,
    mappings = {
        add = 'gsa',
        delete = 'gsd',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'gsr',
        update_n_lines = 'gsn',

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
    },

    -- How to search for surrounding
    -- 'cover', 'cover_or_next', 'cover_or_prev','cover_or_nearest', 'next', 'previous', 'nearest'.
    search_method = 'cover_or_nearest',
    highlight_duration = 500,
    n_lines = 20,
    respect_selection_type = false,
    silent = false,
})
