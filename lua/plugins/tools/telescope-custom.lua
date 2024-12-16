local M = {}

M.flash = function(prompt_bufnr)
    require('flash').jump({
        pattern = '^',
        label = { after = { 0, 0 } },
        search = {
            mode = 'search',
            exclude = {
                function(win)
                    return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'TelescopeResults'
                end,
            },
        },
        action = function(match)
            local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
        end,
    })
end

-- Select multiple files with tab and open them together
M.multi_open = function(prompt_bufnr)
    local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
    local multi = picker:get_multi_selection()
    if not vim.tbl_isempty(multi) then
        require('telescope.actions').close(prompt_bufnr)
        for _, j in pairs(multi) do
            if j.path ~= nil then
                if j.lnum ~= nil then
                    vim.cmd(string.format('%s +%s %s', 'edit', j.lnum, j.path))
                else
                    vim.cmd(string.format('%s %s', 'edit', j.path))
                end
            end
        end
    else
        require('telescope.actions').select_default(prompt_bufnr)
    end
end

-- Do glob search by adding 2 spaces before the pattern during live_grep
M.multi_grep = function(opts)
    local conf = require('telescope.config').values
    local finders = require('telescope.finders')
    local make_entry = require('telescope.make_entry')
    local pickers = require('telescope.pickers')

    opts = opts or {}
    opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
    opts.pattern = opts.pattern or '%s'

    local custom_grep = finders.new_async_job({
        command_generator = function(prompt)
            if not prompt or prompt == '' then
                return nil
            end
            local prompt_split = vim.split(prompt, '  ')

            local args = { 'rg' }
            if prompt_split[1] then
                table.insert(args, '-e')
                table.insert(args, prompt_split[1])
            end

            if prompt_split[2] then
                table.insert(args, '-g')
                local pattern = prompt_split[2]
                table.insert(args, string.format(opts.pattern, pattern))
            end

            return vim.tbl_flatten({
                args,
                { '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
            })
        end,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    })

    pickers
        .new(opts, {
            debounce = 100,
            prompt_title = 'Multi Grep',
            finder = custom_grep,
            previewer = conf.grep_previewer(opts),
            sorter = require('telescope.sorters').empty(),
        })
        :find()
end

return M
