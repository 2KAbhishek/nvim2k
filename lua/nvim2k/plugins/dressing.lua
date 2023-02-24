local status_ok, dressing = pcall(require, 'dressing')
if not status_ok then
    return
end

dressing.setup({
    win_options = {
        -- Window transparency (0-100)
        winblend = 10,
        -- Change default highlight groups (see :help winhl)
        winhighlight = 'Normal:DressingInputNormalFloat,NormalFloat:DressingInputNormalFloat,FloatBorder:DressingInputFloatBorder',
    },
    input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        -- Default prompt string
        default_prompt = 'Input:',

        -- Can be 'left', 'right', or 'center'
        prompt_align = 'left',

        -- When true, <Esc> will close the modal
        insert_only = true,

        -- When true, input will start in insert mode.
        start_in_insert = true,

        -- These are passed to nvim_open_win
        anchor = 'SW',
        border = 'rounded',
        -- 'editor' and 'win' will default to being centered
        relative = 'cursor',

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        prefer_width = 40,
        width = nil,
        -- min_width and max_width can be a list of mixed types.
        -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },

        override = function(conf)
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            return conf
        end,

        -- see :help dressing_get_config
        get_config = nil,
    },
    select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,

        -- Priority list of preferred vim.select implementations
        backend = { 'telescope', 'fzf_lua', 'fzf', 'builtin', 'nui' },

        -- Trim trailing `:` from prompt
        trim_prompt = true,
    },
})
