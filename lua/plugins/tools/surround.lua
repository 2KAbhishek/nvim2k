local status_ok, surround = pcall(require, 'nvim-surround')
if not status_ok then
    return
end

surround.setup({
    keymaps = {
        insert = 'ys',
        insert_line = 'yss',
        visual = 'S',
        delete = 'ds',
        change = 'cs',
    },
    surrounds = {
        HTML = {
            ['t'] = 'type',
            ['T'] = 'whole',
        },
        aliases = {
            ['a'] = '>', -- Single character aliases apply everywhere
            ['b'] = ')',
            ['B'] = '}',
            ['r'] = ']',

            ['q'] = { '"', "'", '`' }, -- Table aliases only apply for changes/deletions
            ['s'] = { ')', ']', '}', '>', "'", '"', '`' },
        },
    },
    highlight = { duration = 2 },
})
