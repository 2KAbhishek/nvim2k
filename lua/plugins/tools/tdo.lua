local tdo = require('tdo')

tdo.setup({
    use_new_command = true,
    add_default_keybindings = true,
    cache = {
        timeout = 5000,
        max_entries = 100,
    },
    completion = {
        offsets = {},
        ignored_files = { 'README.md', 'templates', 'todos.sh' },
    },
})
