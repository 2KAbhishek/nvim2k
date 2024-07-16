local telescope = require('telescope')
local actions = require('telescope.actions')
local icons = require('lib.icons')

local function flash(prompt_bufnr)
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

telescope.setup({
    defaults = {
        layout_config = {
            height = 0.8,
            width = 0.9,
            prompt_position = 'top',
            bottom_pane = {
                height = 0.5,
                preview_width = 0.6,
                preview_cutoff = 120,
            },
            center = {
                height = 0.4,
                preview_cutoff = 40,
            },
            cursor = {
                preview_cutoff = 40,
                preview_width = 0.6,
            },
            horizontal = {
                preview_width = 0.6,
                preview_cutoff = 120,
            },
            vertical = {
                preview_cutoff = 40,
            },
        },
        prompt_prefix = icons.ui.Telescope .. icons.ui.ChevronRight,
        selection_caret = icons.ui.Play,
        multi_icon = icons.ui.Check,
        path_display = { 'smart' },
        -- path_display = { filename_first = { reverse_directories = false } },
        sorting_strategy = 'ascending',

        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-n>'] = actions.cycle_history_next,
                ['<C-p>'] = actions.cycle_history_prev,

                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,

                ['<C-c>'] = actions.close,

                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,

                ['<CR>'] = actions.select_default,
                ['<C-x>'] = actions.select_horizontal,
                ['<C-CR>'] = actions.select_vertical,
                ['<S-CR>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,
                ['<C-s>'] = flash,

                ['<C-u>'] = actions.preview_scrolling_up,
                ['<C-d>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                ['<C-l>'] = actions.complete_tag,
            },

            n = {
                ['q'] = actions.close,
                ['<esc>'] = actions.close,
                ['<CR>'] = actions.select_default,
                ['<C-x>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,
                ['s'] = flash,

                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

                ['j'] = actions.move_selection_next,
                ['k'] = actions.move_selection_previous,
                ['H'] = actions.move_to_top,
                ['M'] = actions.move_to_middle,
                ['L'] = actions.move_to_bottom,

                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,
                ['gg'] = actions.move_to_top,
                ['G'] = actions.move_to_bottom,

                ['<C-u>'] = actions.preview_scrolling_up,
                ['<C-d>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['?'] = actions.which_key,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
        undo = {
            use_delta = true,
            use_custom_command = nil,
            side_by_side = true,
            vim_diff_opts = {
                ctxlen = vim.o.scrolloff * 2,
            },
            entry_format = 'state #$ID, $STAT, $TIME',
            -- time_format = '%d %b %H:%M',
            saved_only = false,
            layout_strategy = 'vertical',
            layout_config = {
                preview_height = 0.7,
            },
            mappings = {
                i = {
                    ['<S-cr>'] = require('telescope-undo.actions').yank_additions,
                    ['<C-cr>'] = require('telescope-undo.actions').yank_deletions,
                    ['<cr>'] = require('telescope-undo.actions').restore,
                },
            },
        },
        menufacture = { mappings = { main_menu = { [{ 'i', 'n' }] = '<C-e>' } } },
    },
})

telescope.load_extension('fzf')
telescope.load_extension('menufacture')
telescope.load_extension('undo')
telescope.load_extension('marks_nvim')
telescope.load_extension('notify')
telescope.load_extension('refactoring')
