local status_ok, mason = pcall(require, 'mason')
if not status_ok then
    return
end

local icons = require('lib.icons')

mason.setup({
    -- Where Mason should put its bin location in your PATH. Can be one of:
    -- - "prepend" (default, Mason's bin location is put first in PATH)
    -- - "append" (Mason's bin location is put at the end of PATH)
    -- - "skip" (doesn't modify PATH)
    ---@type '"prepend"' | '"append"' | '"skip"'
    PATH = 'prepend',

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with package installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
    -- packages that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4,

    ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = 'rounded',

        -- Width of the window. Accepts:
        -- - Integer greater than 1 for fixed width.
        -- - Float in the range of 0-1 for a percentage of screen width.
        width = 0.8,

        -- Height of the window. Accepts:
        -- - Integer greater than 1 for fixed height.
        -- - Float in the range of 0-1 for a percentage of screen height.
        height = 0.8,

        icons = {
            -- The list icon to use for installed packages.
            package_installed = icons.ui.Gear,
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = icons.ui.Download,
            -- The list icon to use for packages that are not installed.
            package_uninstalled = icons.ui.Plus,
        },

        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = '<CR>',
            -- Keymap to install the package under the current cursor position
            install_package = 'i',
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = 'u',
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = 'c',
            -- Keymap to update all installed packages
            update_all_packages = 'U',
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = 'C',
            -- Keymap to uninstall a package
            uninstall_package = 'd',
            -- Keymap to cancel a package installation
            cancel_installation = '<C-c>',
            -- Keymap to apply language filter
            apply_language_filter = '<C-f>',
        },
    },
})
