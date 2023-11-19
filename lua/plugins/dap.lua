local dap_status_ok, dap = pcall(require, 'dap')
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, 'dapui')
if not dap_ui_status_ok then
    return
end

local icons = require('lib.icons')

-- dapui.setup()
dapui.setup({
    icons = { expanded = icons.ui.ArrowClosed, collapsed = icons.ui.ArrowOpen },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has('nvim-0.7'),
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = 'scopes', size = 0.25 },
                'breakpoints',
                -- "stacks",
                -- "watches",
            },
            size = 40, -- 40 columns
            position = 'right',
        },
        {
            elements = {
                'repl',
                'console',
            },
            size = 0.25, -- 25% of total lines
            position = 'bottom',
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = 'single', -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { 'q', '<Esc>' },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    },
})

vim.fn.sign_define('DapBreakpoint', { text = icons.ui.Bug, texthl = 'DiagnosticSignError', linehl = '', numhl = '' })

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

-- python dap configs
dap.adapters.python = {
    type = 'executable',
    command = '/usr/bin/python',
    args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = 'Launch file',

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = '${file}', -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end,
    },
}

-- ruby dap configs
dap.adapters.ruby = {
    type = 'executable',
    command = 'bundle',
    args = { 'exec', 'readapt', 'stdio' },
}

dap.configurations.ruby = {
    {
        type = 'ruby',
        request = 'launch',
        name = 'Rails',
        program = 'bundle',
        programArgs = { 'exec', 'rails', 's' },
        useBundler = true,
    },
}

vim.api.nvim_create_user_command('DapUIToggle', function()
    require('dapui').toggle()
end, {})
