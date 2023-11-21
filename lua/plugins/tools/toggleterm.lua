local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
    return
end

toggleterm.setup({
    size = 20,
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
            border = 'Normal',
            background = 'Normal',
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<A-q>', '<cmd>ToggleTerm<cr>', opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal

vim.api.nvim_create_user_command('LazygitToggle', function()
    local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })
    lazygit:toggle()
end, {})

vim.api.nvim_create_user_command('RubyToggle', function()
    local ruby = Terminal:new({ cmd = 'irb', hidden = true })
    ruby:toggle()
end, {})

vim.api.nvim_create_user_command('ElixirToggle', function()
    local elixir = Terminal:new({ cmd = 'iex', hidden = true })
    elixir:toggle()
end, {})

vim.api.nvim_create_user_command('NodeToggle', function()
    local node = Terminal:new({ cmd = 'node', hidden = true })
    node:toggle()
end, {})

vim.api.nvim_create_user_command('PythonToggle', function()
    local python = Terminal:new({ cmd = 'bpython', hidden = true })
    python:toggle()
end, {})
