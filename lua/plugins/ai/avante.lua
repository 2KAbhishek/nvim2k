local avante = require('avante')

local model_names = {
    'claude-3.5-sonnet',
    'claude-3.7-sonnet',
    'claude-3.7-sonnet-thought',
    'claude-sonnet-4',
    'gemini-2.0-flash-001',
    'gemini-2.5-pro',
    'gpt-4.1',
    'gpt-4o-2024-11-20',
    'o1',
    'o3-mini',
    'o4-mini',
}

avante.setup({
    mode = 'agentic',
    provider = 'copilot-gpt-4.1',
    -- cursor_applying_provider = 'copilot-o3-mini',
    -- auto_suggestions_provider = 'copilot-claude-3.7-sonnet',

    providers = (function()
        local providers_table = {
            copilot = {
                endpoint = 'https://api.githubcopilot.com',
                allow_insecure = false,
                timeout = 10 * 60 * 1000,
                extra_request_body = {
                    temperature = 0,
                    max_completion_tokens = 1000000,
                },
            },
        }
        for _, model_name in ipairs(model_names) do
            local provider_key = 'copilot-' .. model_name
            providers_table[provider_key] = {
                __inherited_from = 'copilot',
                model = model_name,
                display_name = provider_key,
            }
        end

        return providers_table
    end)(),

    behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
        enable_token_counting = true,
    },
    hints = { enabled = false },
    mappings = {
        ---@class AvanteConflictMappings
        diff = {
            ours = 'co',
            theirs = 'ct',
            all_theirs = 'ca',
            both = 'cb',
            cursor = 'cc',
            next = ']x',
            prev = '[x',
        },
        suggestion = {
            accept = '<M-l>',
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
        },
        jump = {
            next = ']]',
            prev = '[[',
        },
        submit = {
            normal = '<CR>',
            insert = '<C-s>',
        },
        cancel = {
            normal = { '<C-c>', '<Esc>', 'q' },
            insert = { '<C-c>' },
        },
        ask = '<leader>aa',
        edit = '<leader>ae',
        refresh = '<leader>ar',
        focus = '<leader>af',
        stop = '<leader>as',
        select_model = '<leader>aM',
        select_history = '<leader>ah',
        files = {
            add_current = '<leader>ac',
            add_all_buffers = '<leader>ab',
        },
        toggle = {
            default = '<leader>at',
            debug = '<leader>ad',
            hint = '<leader>aH',
            suggestion = '<leader>aS',
            repomap = '<leader>aR',
        },
        sidebar = {
            apply_all = 'A',
            apply_cursor = 'a',
            retry_user_request = 'r',
            edit_user_request = 'e',
            switch_windows = '<Tab>',
            reverse_switch_windows = '<S-Tab>',
            remove_file = 'd',
            add_file = 'a',
            close = { 'q' },
            close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
        },
    },
    windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = 'right',
        wrap = true,
        width = 40,
        sidebar_header = {
            enabled = true,
            align = 'center',
            rounded = true,
        },
        input = {
            prefix = '> ',
            height = 32,
        },
        edit = {
            border = 'rounded',
            start_insert = true,
        },
        ask = {
            floating = false,
            start_insert = true,
            border = 'rounded',
            ---@type "ours" | "theirs"
            focus_on_apply = 'ours',
        },
    },
    highlights = {
        diff = {
            current = 'DiffText',
            incoming = 'DiffAdd',
        },
    },
    --- @class AvanteConflictUserConfig
    diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = 'copen',
        override_timeoutlen = 500,
    },
    suggestion = {
        debounce = 600,
        throttle = 600,
    },
    system_prompt = function()
        local hub = require('mcphub').get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ''
    end,
    custom_tools = function()
        return {
            require('mcphub.extensions.avante').mcp_tool(),
        }
    end,
    disabled_tools = {
        'replace_in_file',
        'web_search',
    },
    slash_commands = {},
})
