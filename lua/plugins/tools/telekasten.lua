local status_ok, telekasten = pcall(require, 'telekasten')
if not status_ok then
    return
end

local os = require('os')
local year = os.date('%Y')
local month = os.date('%m')

local notes_root = vim.fn.expand(os.getenv('NOTES_DIR'))
local entry_dir = vim.fn.expand(os.getenv('ENTRY_DIR'))
local creative_dir = vim.fn.expand(os.getenv('CREATIVE_DIR'))

if not notes_root then
    notes_root = vim.fn.expand('~/Projects/GitHub/Notes/worklog/')
end

local notes_dir = notes_root .. '/notes/'
local templates_dir = notes_dir .. 'templates/'
local log_dir = notes_root .. '/log/'

telekasten.setup({
    home = notes_dir,

    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,

    -- dir names for special notes (absolute path or subdir name)
    dailies = log_dir .. year .. '/' .. month,
    weeklies = log_dir .. year .. '/weekly',
    templates = templates_dir,

    -- image (sub)dir for pasting
    -- dir name (absolute path or subdir name)
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = 'images',

    -- markdown file extension
    extension = '.md',

    -- Generate note filenames. One of:
    -- "title" (default) - Use title if supplied, uuid otherwise
    -- "uuid" - Use uuid
    -- "uuid-title" - Prefix title by uuid
    -- "title-uuid" - Suffix title with uuid
    new_note_filename = 'title',
    -- file uuid type ("rand" or input for os.date()")
    uuid_type = '%Y-%m-%d',
    -- UUID separator
    uuid_sep = '-',

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- skip telescope prompt for goto_today and goto_thisweek
    journal_auto_open = true,

    template_new_note = templates_dir .. 'note.md',
    template_new_daily = templates_dir .. 'todo.md',
    template_new_weekly = templates_dir .. 'weekly.md',

    image_link_style = 'markdown',

    -- default sort option: 'filename', 'modified'
    sort = 'filename',

    -- integrate with calendar-vim
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 2,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 0,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'right',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = '#tag',

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = 'ivy',

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = 'ivy',

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    template_handling = 'smart',
    new_note_location = 'smart',

    -- should all links be updated when a file is renamed
    rename_update_links = true,

    vaults = {
        entry = {
            home = entry_dir,
            dailies = year .. '/' .. month,
        },
        creative = {
            home = creative_dir .. year .. '/' .. month,
            new_note_filename = 'title',
            uuid_type = '%Y-%m-%d-%H-%M',
            template_new_note = creative_dir .. 'template.md',
        },
    },

    -- how to preview media files
    -- "telescope-media-files" if you have telescope-media-files.nvim installed
    -- "catimg-previewer" if you have catimg installed
    media_previewer = 'telescope-media-files',

    -- A customizable fallback handler for urls.
    follow_url_fallback = nil,
})
