local status_ok, twilight = pcall(require, 'twilight')
if not status_ok then
    return
end

twilight.setup({
    dimming = { alpha = 0.45, color = { 'Normal', '#ffffff' }, inactive = false },
    context = 9,
    treesitter = true,
    expand = { 'function', 'method', 'table', 'if_statement', 'element' },
    exclude = {},
})
