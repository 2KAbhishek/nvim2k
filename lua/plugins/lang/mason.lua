local mason = require('mason')

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
            uninstall_package = 'x',
            cancel_installation = '<C-c>',
            apply_language_filter = '<C-f>',
        },
    },
})
