local status_ok, mason = pcall(require, 'mason')
if not status_ok then
    return
end

local icons = require('lib.icons')
mason.setup({
    -- - "prepend": Use mason binary, "append": Use system binary
    PATH = 'append',

    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 8,

    ui = {
        check_outdated_packages_on_open = true,
        border = 'rounded',
        width = 0.8,
        height = 0.8,

        icons = {
            package_installed = icons.ui.Gear,
            package_pending = icons.ui.Download,
            package_uninstalled = icons.ui.Plus,
        },

        keymaps = {
            toggle_package_expand = '<CR>',
            install_package = 'i',
            update_package = 'u',
            check_package_version = 'c',
            update_all_packages = 'U',
            check_outdated_packages = 'C',
            uninstall_package = 'd',
            cancel_installation = '<C-c>',
            apply_language_filter = '<C-f>',
        },
    },
})
