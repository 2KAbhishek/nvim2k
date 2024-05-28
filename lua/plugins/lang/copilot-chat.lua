local chat = require('CopilotChat')
local icons = require('lib.icons')

chat.setup({
    debug = false, -- Enable debug logging
    proxy = nil, -- [protocol://]host[:port] Use this proxy
    allow_insecure = false, -- Allow insecure server connections
    model = 'gpt-4', -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
    temperature = 0.1, -- GPT temperature

    question_header = '# ' .. icons.ui.User .. 'User', -- Header to use for user questions
    answer_header = '# ' .. icons.ui.Copilot .. 'Copilot', -- Header to use for AI answers
    error_header = '## ' .. icons.ui.CopilotError .. 'Error', -- Header to use for errors
    separator = '\n──────────────', -- Separator to use in chat

    show_folds = true, -- Shows folds for sections in chat
    show_help = true, -- Shows help message as virtual lines when waiting for user input
    auto_follow_cursor = true, -- Auto-follow cursor in chat
    auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
    clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
    highlight_selection = true, -- Highlight selection in the source buffer when in the chat window

    context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
    history_path = vim.fn.stdpath('data') .. '/copilot_chat_history', -- Default path to stored history
    callback = nil, -- Callback to use when ask response is received

    -- default window options
    window = {
        layout = 'horizontal', -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.4, -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
        border = 'rounded', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil, -- row position of the window, default is centered
        col = nil, -- column position of the window, default is centered
        title = icons.ui.Copilot .. ' Copilot Chat', -- title of chat window
        footer = nil, -- footer of chat window
        zindex = 1, -- determines if window is on top or below other floating windows
    },

    -- default mappings
    mappings = {
        complete = {
            detail = 'Use @<Tab> or /<Tab> for options.',
            insert = '<Tab>',
        },
        close = {
            normal = 'q',
            insert = '<C-c>',
        },
        reset = {
            normal = '<C-l>',
            insert = '<C-l>',
        },
        submit_prompt = {
            normal = '<CR>',
            insert = '<C-m>',
        },
        accept_diff = {
            normal = '<C-y>',
            insert = '<C-y>',
        },
        yank_diff = {
            normal = 'gy',
        },
        show_diff = {
            normal = 'gd',
        },
        show_system_prompt = {
            normal = 'gp',
        },
        show_user_selection = {
            normal = 'gs',
        },
    },
})
