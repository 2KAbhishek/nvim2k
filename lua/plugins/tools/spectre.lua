local spectre = require('spectre')

spectre.setup({
    color_devicons = true,
    highlight = {
        ui = 'String',
        search = 'DiffChange',
        replace = 'DiffDelete',
    },
    mapping = {
        ['toggle_line'] = {
            map = 't',
            cmd = ":lua require('spectre').toggle_line()<cr>",
            desc = 'toggle current item',
        },
        ['enter_file'] = {
            map = '<cr>',
            cmd = ":lua require('spectre.actions').select_entry()<cr>",
            desc = 'goto current file',
        },
        ['send_to_qf'] = {
            map = 'Q',
            cmd = ":lua require('spectre.actions').send_to_qf()<cr>",
            desc = 'send all item to quickfix',
        },
        ['replace_cmd'] = {
            map = 'c',
            cmd = ":lua require('spectre.actions').replace_cmd()<cr>",
            desc = 'input replace vim command',
        },
        ['show_option_menu'] = {
            map = 'o',
            cmd = ":lua require('spectre').show_options()<cr>",
            desc = 'show option',
        },
        ['run_replace'] = {
            map = 'R',
            cmd = ":lua require('spectre.actions').run_replace()<cr>",
            desc = 'replace all',
        },
        ['change_view_mode'] = {
            map = 'm',
            cmd = ":lua require('spectre').change_view()<cr>",
            desc = 'change result view mode',
        },
        ['toggle_ignore_case'] = {
            map = 'I',
            cmd = ":lua require('spectre').change_options('ignore-case')<cr>",
            desc = 'toggle ignore case',
        },
        ['toggle_ignore_hidden'] = {
            map = 'H',
            cmd = ":lua require('spectre').change_options('hidden')<cr>",
            desc = 'toggle search hidden',
        },
    },
    find_engine = {
        ['rg'] = {
            cmd = 'rg',
            args = {
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
            },
            options = {
                ['ignore-case'] = {
                    value = '--ignore-case',
                    icon = '[I]',
                    desc = 'ignore case',
                },
                ['hidden'] = {
                    value = '--hidden',
                    desc = 'hidden file',
                    icon = '[H]',
                },
            },
        },
        ['ag'] = {
            cmd = 'ag',
            args = {
                '--vimgrep',
                '-s',
            },
            options = {
                ['ignore-case'] = {
                    value = '-i',
                    icon = '[I]',
                    desc = 'ignore case',
                },
                ['hidden'] = {
                    value = '--hidden',
                    desc = 'hidden file',
                    icon = '[H]',
                },
            },
        },
    },
    replace_engine = {
        ['sed'] = {
            cmd = 'sed',
            args = nil,
        },
        options = {
            ['ignore-case'] = {
                value = '--ignore-case',
                icon = '[I]',
                desc = 'ignore case',
            },
        },
    },
    default = {
        find = {
            cmd = 'rg',
            options = { 'ignore-case' },
        },
        replace = {
            cmd = 'sed',
        },
    },
    replace_vim_cmd = 'cdo',
    is_open_target_win = true,
    is_insert_mode = true,
})
