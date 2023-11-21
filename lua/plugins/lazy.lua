local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    return
end

local icons = require('lib.icons')
local plugins = require('plugins.list')

lazy.setup({
    root = vim.fn.stdpath('data') .. '/lazy', -- directory where plugins will be installed
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
        -- version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    -- leave nil when passing the spec as the first argument to setup()
    spec = plugins, ---Lazy plugins list
    lockfile = vim.fn.stdpath('config') .. '/lua/plugins/lock.json', -- lockfile generated after running update.
    concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
    git = {
        -- defaults for the `Lazy log` command
        -- log = { "-10" }, -- show the last 10 commits
        log = { '--since=3 days ago' }, -- show commits from the last 3 days
        timeout = 120, -- kill processes that take more than 2 minutes
        url_format = 'https://github.com/%s.git',
        -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
        -- then set the below to false. This is should work, but is NOT supported and will
        -- increase downloads a lot.
        filter = true,
    },
    dev = {
        -- directory where you store your local plugin projects
        path = '~/Projects',
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
        fallback = false, -- Fallback to git when local plugin doesn't exist
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { 'onedark' },
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.9, height = 0.8 },
        wrap = true, -- wrap the lines in the ui
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = 'rounded',
        icons = {
            cmd = icons.ui.Terminal,
            config = icons.ui.Gear,
            event = icons.ui.Electric,
            ft = icons.documents.File,
            init = icons.ui.Rocket,
            import = icons.documents.Import,
            keys = icons.ui.Keyboard,
            lazy = icons.ui.Sleep,
            loaded = icons.ui.CircleSmall,
            not_loaded = icons.ui.CircleSmallEmpty,
            plugin = icons.ui.Package,
            runtime = icons.ui.NeoVim,
            source = icons.ui.Code,
            start = icons.ui.Play,
            task = icons.ui.Check,
            list = {
                icons.ui.CircleSmall,
                icons.ui.Arrow,
                icons.ui.Star,
                icons.ui.Minus,
            },
        },
        -- leave nil, to automatically select a browser depending on your OS.
        -- If you want to use a specific browser, you can define it here
        browser = nil, ---@type string?
        throttle = 20, -- how frequently should the ui process render events
        custom_keys = {
            -- you can define custom key maps here.
            -- To disable one of the defaults, set it to false

            -- open lazygit log
            ['<localleader>l'] = function(plugin)
                require('lazy.util').float_term({ 'lazygit', 'log' }, {
                    cwd = plugin.dir,
                })
            end,

            -- open a terminal for the plugin dir
            ['<localleader>t'] = function(plugin)
                require('lazy.util').float_term(nil, {
                    cwd = plugin.dir,
                })
            end,
        },
    },
    diff = {
        -- diff command <d> can be one of:
        -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
        --   so you can have a different command for diff <d>
        -- * git: will run git diff and open a buffer with filetype git
        -- * terminal_git: will open a pseudo terminal with git diff
        -- * diffview.nvim: will open Diffview to show the diff
        cmd = 'git',
    },
    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = true, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = true, -- get a notification when changes are found
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
            ---@type string[]
            paths = {}, -- add any custom paths here that you want to includes in the rtp
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                -- 'gzip',
                -- 'matchit',
                -- 'matchparen',
                -- 'netrwPlugin',
                -- 'tarPlugin',
                -- 'tohtml',
                -- 'tutor',
                -- 'zipPlugin',
            },
        },
    },
    -- lazy can generate helptags from the headings in markdown readme files,
    -- so :help works even for plugins that don't have vim docs.
    -- when the readme opens with :help it will be correctly displayed as markdown
    readme = {
        root = vim.fn.stdpath('state') .. '/lazy/readme',
        files = { 'README.md', 'lua/**/README.md' },
        -- only generate markdown helptags for plugins that dont have docs
        skip_if_doc_exists = true,
    },
    state = vim.fn.stdpath('state') .. '/lazy/state.json', -- state info for checker and other things
})
