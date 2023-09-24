local function augroup(name)
    return vim.api.nvim_create_augroup('nvim2k_' .. name, { clear = true })
end

-- Jump to last known position
vim.api.nvim_create_autocmd('BufRead', {
    callback = function(opts)
        vim.api.nvim_create_autocmd('BufWinEnter', {
            once = true,
            buffer = opts.buf,
            callback = function()
                local ft = vim.bo[opts.buf].filetype
                local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
                if
                    not (ft:match('commit') and ft:match('rebase'))
                    and last_known_line > 1
                    and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
                then
                    vim.api.nvim_feedkeys([[g`"]], 'nx', false)
                end
            end,
        })
    end,
})

-- Terminal buffer options
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    group = augroup('bufenter'),
    pattern = { 'term://*' },
    callback = function()
        vim.cmd('startinsert!')
        vim.cmd('set cmdheight=1')
    end,
})

-- Strip trailing spaces before write
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = augroup('strip_space'),
    pattern = { '*' },
    callback = function()
        vim.cmd([[ %s/\s\+$//e ]])
    end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = augroup('checktime'),
    command = 'checktime',
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup('highlight_yank'),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
    group = augroup('resize_splits'),
    callback = function()
        vim.cmd('tabdo wincmd =')
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup('last_loc'),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('close_with_q'),
    pattern = {
        'PlenaryTestPopup',
        'help',
        'Jaq',
        'lir',
        'DressingSelect',
        'lspinfo',
        'man',
        'notify',
        'qf',
        'spectre_panel',
        'startuptime',
        'tsplayground',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('wrap_spell'),
    pattern = { 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = augroup('auto_create_dir'),
    callback = function(event)
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})
