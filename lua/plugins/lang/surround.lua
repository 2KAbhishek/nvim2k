local status_ok, surround = pcall(require, 'mini.surround')
if not status_ok then
    return
end

surround.setup({
    custom_surroundings = nil,
    highlight_duration = 500,

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

    n_lines = 20,
    respect_selection_type = false,
    search_method = 'cover',
    silent = false,
})
