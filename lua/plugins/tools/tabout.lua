local status_ok, tabout = pcall(require, 'tabout')
if not status_ok then
    return
end

tabout.setup({
    tabkey = '<tab>',
    backwards_tabkey = '<s-tab>',
    act_as_tab = true,
    act_as_shift_tab = true,
    default_tab = '<C-t>',
    default_shift_tab = '<C-d>',
    enable_backwards = false,
    completion = true,
    tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = '`', close = '`' },
        { open = '(', close = ')' },
        { open = '[', close = ']' },
        { open = '{', close = '}' },
    },
    ignore_beginning = true,
    exclude = { 'markdown' },
})
