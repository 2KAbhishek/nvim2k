local harpoon = require('harpoon')
harpoon:setup({})

local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require('telescope.pickers')
        .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        })
        :find()
end

vim.keymap.set('n', '<leader>ha', function()
    harpoon:list():append()
end, { desc = 'Add Mark' })
vim.keymap.set('n', '<leader>hh', function()
    toggle_telescope(harpoon:list())
end, { desc = 'Telescope Marks' })
vim.keymap.set('n', '<leader>hm', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Open UI' })

vim.keymap.set('n', '[h', function()
    harpoon:list():prev()
end, { desc = 'Prev Mark' })
vim.keymap.set('n', ']h', function()
    harpoon:list():next()
end, { desc = 'Next Mark' })

vim.keymap.set('n', '<leader>hk', function()
    harpoon:list():prev()
end, { desc = 'Prev Mark' })
vim.keymap.set('n', '<leader>hj', function()
    harpoon:list():next()
end, { desc = 'Next Mark' })

for i = 1, 9 do
    vim.keymap.set('n', '<leader>h' .. i, function()
        harpoon:list():select(i)
    end, { desc = 'Mark ' .. i })
end
