local status_ok, wilder = pcall(require, 'wilder')
if not status_ok then
    return
end

wilder.setup({ modes = { ':', '/', '?' } })

wilder.set_option('pipeline', {
    wilder.branch(
        wilder.python_file_finder_pipeline({
            file_command = { 'rg', '--files', '--hidden' },
            dir_command = { 'fd', '-td'},
            filters = { 'fuzzy_filter', 'difflib_sorter' },
        }),
        wilder.cmdline_pipeline({
            -- sets the language to use, 'vim' and 'python' are supported
            language = 'python',
            -- 0 turns off fuzzy matching
            -- 1 turns on fuzzy matching
            -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
            fuzzy = 2,
        }),
        wilder.python_search_pipeline({
            -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
            pattern = wilder.python_fuzzy_delimiter_pattern(),
            -- omit to get results in the order they appear in the buffer
            sorter = wilder.python_difflib_sorter(),
            -- can be set to 're2' for performance, requires pyre2 to be installed
            -- see :h wilder#python_search() for more details
            engine = 're',
        })
    ),
})

local accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#00AAFF' } })
local icons = require('lib.icons')

local popupmenu_renderer = wilder.popupmenu_renderer(
    wilder.popupmenu_palette_theme({
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
        border = 'rounded',
        max_height = '75%', -- max height of the palette
        min_height = 0, -- set to the same as 'max_height' for a fixed height window
        prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
        reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
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
                icons = { ['+'] = icons.ui.Pencil, a = icons.documents.File, h = icons.documents.FileEmpty },
            }),
        },
        right = {
            ' ',
            wilder.popupmenu_scrollbar(),
        },
    })
)

local wildmenu_renderer = wilder.wildmenu_renderer({
    highlighter = wilder.basic_highlighter(),
    highlights = {
        accent = accent,
    },
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
        substitute = wildmenu_renderer
    })
)
