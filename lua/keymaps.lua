local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end
local opts = { noremap = true, silent = true }

-- Space as leader
map('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
map('n', '<C-Space>', '<cmd>WhichKey \\<leader><cr>', opts)
map('n', '<C-p>', '<cmd>Telescope git_files<cr>', opts)
map('n', '<C-g>', '<cmd>lua _LAZYGIT_TOGGLE()<cr>', opts)
map('n', '<C-i>', '<C-i>', opts)

-- Use jj as escape
map('i', 'jj', '<Esc>', opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Delete a word backwards
-- map('n', 'dw', 'vb"_d', opts)

-- I hate typing these
-- map("n", "H", "^", opts)
-- map("n", "L", "$", opts)
map('v', 'H', '^', opts)
map('v', 'L', '$', opts)
map('x', 'H', '^', opts)
map('x', 'L', '$', opts)
map('o', 'H', '^', opts)
map('o', 'L', '$', opts)

-- Paste
map('v', 'p', '"_dP', opts)
map('x', '<leader>pp', '"_dP', opts)

-- Do not copy on x
map('n', 'x', '"_x', opts)

-- Increment/decrement
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)

-- New tab
map('n', 'te', ':tabedit ', opts)
-- Split window
map('n', 'ts', ':split ', opts)
map('n', 'tv', ':vsplit ', opts)

-- Switch window
map('n', 'tw', '<C-w>w', opts)
map('', 'th', '<C-w>h', opts)
map('', 'tk', '<C-w>k', opts)
map('', 'tj', '<C-w>j', opts)
map('', 'tl', '<C-w>l', opts)

-- alt binds
map('n', '<m-s>', '<cmd>split<cr>', opts)
map('n', '<m-v>', '<cmd>vsplit<cr>', opts)
map('n', '<m-q>', '<cmd>:q<cr>', opts)

-- open link under cursor
map('n', 'gx', [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- LSP
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- Center Cursors
map('n', 'J', 'mzJ`z', opts)
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Search and replace
map('n', '<leader>ss', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- better up/down
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Switch buffers
map('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
map('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
map('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
map('n', ']b', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
map('n', '<leader><tab>', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })

-- Move text up and down
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)
map('x', 'J', ":move '>+1<CR>gv-gv", opts)
map('x', 'K', ":move '<-2<CR>gv-gv", opts)
map('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
map('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Clear search, diff update and redraw
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Search word under cursor
map({ 'n', 'x' }, 'gw', '*N', { desc = 'Search word under cursor' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- save file
map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- windows
map('n', '<leader>w<tab>', '<C-W>p', { desc = 'Other window' })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete window' })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below' })
map('n', '<leader>w\\', '<C-W>v', { desc = 'Split window right' })
map('n', '<leader>-', '<C-W>s', { desc = 'Split window below' })
map('n', '<leader>\\', '<C-W>v', { desc = 'Split window right' })
