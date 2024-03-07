local wilder = require('wilder')

wilder.setup({ modes = { ':', '/', '?' } })

wilder.set_option('pipeline', {
    wilder.branch(
        wilder.python_file_finder_pipeline({
            file_command = { 'rg', '--files', '--hidden' },
            dir_command = { 'fd', '-td' },
            filters = { 'fuzzy_filter', 'difflib_sorter' },
        }),
        wilder.cmdline_pipeline({ language = 'python', fuzzy = 2 }),
        wilder.python_search_pipeline({
            pattern = wilder.python_fuzzy_delimiter_pattern(),
            sorter = wilder.python_difflib_sorter(),
            engine = 're',
        })
    ),
})

local accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#00AAFF' } })
local icons = require('lib.icons')

local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
    border = 'rounded',
    max_height = '75%',
    min_height = 0,
    prompt_position = 'top',
    reverse = 0,
    empty_message = wilder.popupmenu_empty_message_with_spinner(),
    highlighter = wilder.basic_highlighter(),
    highlights = {
        accent = accent,
    },
    left = {
        ' ',
        wilder.popupmenu_devicons(),
        wilder.popupmenu_buffer_flags({
            flags = ' a + ',
            icons = {
                ['+'] = icons.ui.Pencil,
                a = icons.documents.File,
                h = icons.documents.FileEmpty,
            },
        }),
    },
    right = {
        ' ',
        wilder.popupmenu_scrollbar(),
    },
}))

local wildmenu_renderer = wilder.wildmenu_renderer({
    highlighter = wilder.basic_highlighter(),
    highlights = { accent = accent },
    separator = ' | ',
    left = { ' ', wilder.wildmenu_spinner(), ' ' },
    right = { ' ', wilder.wildmenu_index() },
})

wilder.set_option(
    'renderer',
    wilder.renderer_mux({
        [':'] = popupmenu_renderer,
        ['/'] = popupmenu_renderer,
        ['?'] = popupmenu_renderer,
        substitute = wildmenu_renderer,
    })
)
