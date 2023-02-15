vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local status_ok, lsp = pcall(require, 'lsp-zero')
if not status_ok then
    return
end
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
})

lsp.nvim_workspace()

lsp.setup()
