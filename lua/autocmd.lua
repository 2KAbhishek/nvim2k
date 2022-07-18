
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "Jaq", "qf", "help", "man", "lspinfo", "spectre_panel", "lir", "DressingSelect", "tsplayground" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "term://*" },
  callback = function()
    vim.cmd "startinsert!"
    -- TODO: if java = 2
    vim.cmd "set cmdheight=1"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd([[
    " Have Vim jump to the last position when reopening a file
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
    endif

    " Remove trailing whitespace on write
    if has("autocmd")
        autocmd BufWritePre * %s/\s\+$//e
    endif
]])
