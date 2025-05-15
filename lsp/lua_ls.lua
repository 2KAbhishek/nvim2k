return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
            format = {
                enable = true,
                defaultConfig = {
                    align_continuous_assign_statement = false,
                    align_continuous_rect_table_field = false,
                    align_array_table = false,
                },
            },
            runtime = {
                version = 'LuaJIT',
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- vim.api.nvim_get_runtime_file('', true),
                    -- '${3rd}/busted/library'
                },
            },
        },
    },
}
