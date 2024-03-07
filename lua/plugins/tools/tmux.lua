local tmux = require('tmux')

tmux.setup({
    copy_sync = {
        enable = false,
        ignore_buffers = { empty = false },
        redirect_to_clipboard = false,
        register_offset = 0,
        sync_clipboard = false,
        sync_registers = false,
        sync_deletes = false,
        sync_unnamed = false,
    },
    navigation = {
        cycle_navigation = true,
        enable_default_keybindings = true,
        persist_zoom = false,
    },
    resize = {
        enable_default_keybindings = true,
        resize_step_x = 1,
        resize_step_y = 1,
    },
})
