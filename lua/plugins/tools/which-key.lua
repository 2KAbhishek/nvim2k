local which_key = require('which-key')
local icons = require('lib.icons')
local Snacks = require('snacks')
local util = require('lib.util')

local setup = {
    preset = 'modern',
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 30,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    icons = {
        breadcrumb = icons.ui.ArrowOpen,
        separator = icons.ui.Arrow,
        group = '',
        keys = {
            Space = icons.ui.Rocket,
        },
        rules = false, -- enable auto icon rules
    },
    win = {
        no_overlap = true,
        border = 'rounded',
        width = 0.8,
        height = { min = 5, max = 25 },
        padding = { 1, 2 },
        title = true,
        title_pos = 'center',
        zindex = 1000,
        wo = {
            winblend = 10,
        },
    },
    layout = {
        width = { min = 20 },
        spacing = 6,
        align = 'center',
    },
    show_help = false,
    show_keys = true,
    triggers = {
        { '<auto>', mode = 'nixsotc' },
        { '<leader>', mode = { 'n', 'v' } },
    },
}

local normal_mappings = {
    mode = 'n',
    {
        '<leader><space>',
        function()
            Snacks.picker.smart()
        end,
        desc = 'Smart Find Files',
    },
    {
        '<leader>,',
        function()
            Snacks.picker.buffers()
        end,
        desc = 'Buffers',
    },
    {
        '<leader>/',
        function()
            Snacks.picker.search_history()
        end,
        desc = 'Search History',
    },
    {
        '<leader>:',
        function()
            Snacks.picker.command_history()
        end,
        desc = 'Command History',
    },

    { '<leader>a', group = ' AI' },
    { '<leader>aF', '<cmd>CopilotChatFixDiagnostic<cr>', desc = 'Fix Diagnostic' },
    { '<leader>aG', '<cmd>CopilotChatCommitStaged<cr>', desc = 'Commit Staged' },
    { '<leader>ac', '<cmd>CopilotChatToggle<cr>', desc = 'Copilot Chat' },
    { '<leader>ad', '<cmd>CopilotChatDocs<cr>', desc = 'Docs' },
    { '<leader>ae', '<cmd>CopilotChatExplain<cr>', desc = 'Explain' },
    { '<leader>af', '<cmd>CopilotChatFix<cr>', desc = 'Fix' },
    { '<leader>ag', '<cmd>CopilotChatCommit<cr>', desc = 'Commit' },
    { '<leader>al', '<cmd>CopilotChatLoad<cr>', desc = 'Load Chat' },
    { '<leader>ao', '<cmd>CopilotChatOptimize<cr>', desc = 'Optimize' },
    { '<leader>ar', '<cmd>CopilotChatReview<cr>', desc = 'Review' },
    { '<leader>as', '<cmd>CopilotChatSave<cr>', desc = 'Save Chat' },
    { '<leader>at', '<cmd>CopilotChatTests<cr>', desc = 'Tests' },

    { '<leader>c', group = ' Code' },
    { '<leader>cF', '<cmd>retab<cr>', desc = 'Fix Tabs' },
    { '<leader>cP', '<cmd>CccConvert<cr>', desc = 'Convert Color' },
    { '<leader>cR', '<cmd>ReloadConfig<cr>', desc = 'Reload Configs' },
    { '<leader>cc', '<cmd>CccHighlighterToggle<cr>', desc = 'Highlight Colors' },
    { '<leader>cd', '<cmd>RootDir<cr>', desc = 'Root Directory' },
    { '<leader>ce', '<cmd>%SnipRun<cr>', desc = 'Execute File' },
    { '<leader>cf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', desc = 'Format File' },
    { '<leader>cl', '<cmd>:g/^\\s*$/d<cr>', desc = 'Clean Empty Lines' },
    { '<leader>cm', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview' },
    { '<leader>co', '<cmd>Dashboard<cr>', desc = 'Dashboard' },
    { '<leader>cp', '<cmd>CccPick<cr>', desc = 'Pick Color' },
    { '<leader>cs', '<cmd>source %<cr>', desc = 'Source File' },

    { '<leader>e', group = ' Edit' },
    { '<leader>ea', '<cmd>b#<cr>', desc = 'Alternate File' },
    { '<leader>ec', group = 'Edit Configs' },
    { '<leader>eca', '<cmd>e ~/.config/shell/aliases.sh<cr>', desc = 'Shell Aliases' },
    { '<leader>ecA', '<cmd>e ~/.config/alacritty/alacritty.toml<cr>', desc = 'Alacritty Config' },
    { '<leader>ecb', '<cmd>e ~/.bashrc<cr>', desc = 'Bash Config' },
    { '<leader>ece', '<cmd>e ~/.config/shell/environment.sh<cr>', desc = 'Environment Config' },
    { '<leader>ecf', '<cmd>e ~/.config/shell/functions.sh<cr>', desc = 'Shell Functions' },
    { '<leader>ecg', '<cmd>e ~/.gitconfig<cr>', desc = 'Git Config' },
    { '<leader>eck', '<cmd>e ~/.config/kitty/kitty.conf<cr>', desc = 'Kitty Config' },
    { '<leader>ecl', '<cmd>e ~/.config/shell/local.sh<cr>', desc = 'Local Env' },
    { '<leader>ecn', '<cmd>e $MYVIMRC<cr>', desc = 'Neovim Init' },
    { '<leader>ecp', '<cmd>e ~/.config/nvim/lua/plugins/list.lua<cr>', desc = 'Plugin List' },
    { '<leader>ecq', '<cmd>e ~/.config/qutebrowser/config.py<cr>', desc = 'Qutebrowser Config' },
    { '<leader>ect', '<cmd>e ~/.config/tmux/tmux.conf<cr>', desc = 'Tmux Config' },
    { '<leader>ecv', '<cmd>e ~/.vimrc<cr>', desc = 'Vim Config' },
    { '<leader>ecz', '<cmd>e $ZDOTDIR/.zshrc<cr>', desc = 'Zsh Config' },
    { '<leader>ecZ', '<cmd>e $ZDOTDIR/prompt/init.zsh<cr>', desc = 'Zsh Prompt Config' },
    { '<leader>et', '<cmd>lua MiniFiles.open()<cr>', desc = 'Explore Tree' },
    { '<leader>ef', 'gf', desc = 'File Under Cursor' },
    { '<leader>em', '<cmd>e README.md<cr>', desc = 'Readme' },
    { '<leader>en', '<cmd>enew<cr>', desc = 'New File' },
    {
        '<leader>ecc',
        function()
            Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
        end,
        desc = 'Neovim Configs',
    },
    {
        '<leader>eE',
        function()
            Snacks.explorer()
        end,
        desc = 'File Explorer',
    },

    { '<leader>f', group = ' Find' },
    {
        '<leader>fa',
        function()
            Snacks.picker.files()
        end,
        desc = 'Find Files',
    },
    {
        '<leader>fb',
        function()
            Snacks.picker.buffers()
        end,
        desc = 'Buffers',
    },
    {
        '<leader>fc',
        function()
            Snacks.picker.git_log_file()
        end,
        desc = 'File Commits',
    },
    {
        '<leader>fd',
        function()
            Snacks.picker.projects()
        end,
        desc = 'Project Dirs',
    },
    {
        '<leader>ff',
        function()
            Snacks.picker.git_files()
        end,
        desc = 'Find Git Files',
    },
    {
        '<leader>fg',
        function()
            Snacks.picker.grep()
        end,
        desc = 'Grep',
    },
    {
        '<leader>fl',
        function()
            Snacks.picker.loclist()
        end,
        desc = 'Location List',
    },
    {
        '<leader>fm',
        function()
            Snacks.picker.git_status()
        end,
        desc = 'Git Status',
    },
    {
        '<leader>fo',
        function()
            Snacks.picker.grep_buffers()
        end,
        desc = 'Grep Open Buffers',
    },
    {
        '<leader>fp',
        function()
            Snacks.picker.resume()
        end,
        desc = 'Previous Picker',
    },
    {
        '<leader>fq',
        function()
            Snacks.picker.qflist()
        end,
        desc = 'Quickfix List',
    },
    {
        '<leader>fr',
        function()
            Snacks.picker.recent()
        end,
        desc = 'Recent',
    },
    {
        '<leader>fs',
        function()
            Snacks.picker.lines()
        end,
        desc = 'Buffer Lines',
    },
    {
        '<leader>fu',
        function()
            Snacks.picker.undo()
        end,
        desc = 'Undo History',
    },
    {
        '<leader>fw',
        function()
            Snacks.picker.grep_word()
        end,
        desc = 'Word Grep',
        mode = { 'n', 'x' },
    },

    { '<leader>g', group = ' Git' },
    { '<leader>gA', '<cmd>Gitsigns stage_buffer<cr>', desc = 'Stage Buffer' },
    { '<leader>gC', '<cmd>CoAuthor<cr>', desc = 'Co-Authors' },
    { '<leader>gP', '<cmd>Git push<cr>', desc = 'Push' },
    { '<leader>gR', '<cmd>Gitsigns reset_buffer<cr>', desc = 'Reset Buffer' },
    { '<leader>ga', '<cmd>Gitsigns stage_hunk<cr>', desc = 'Stage Hunk' },
    { '<leader>gb', "<cmd>lua require('gitsigns').blame_line({full = true})<cr>", desc = 'Blame' },
    { '<leader>gB', "<cmd>lua require('snacks').git.blame_line()<cr>", desc = 'Detailed Blame' },
    { '<leader>gF', '<cmd>Git<cr>', desc = 'Fugitive Panel' },
    { '<leader>gg', '<cmd>lua require("snacks").lazygit()<cr>', desc = 'Lazygit' },
    { '<leader>gi', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Hunk Info' },
    { '<leader>gj', '<cmd>Gitsigns next_hunk<cr>', desc = 'Next Hunk' },
    { '<leader>gk', '<cmd>Gitsigns prev_hunk<cr>', desc = 'Prev Hunk' },
    { '<leader>go', group = 'Octohub' },
    { '<leader>gp', '<cmd>Git pull<cr>', desc = 'Pull' },
    { '<leader>gr', '<cmd>Gitsigns reset_hunk<cr>', desc = 'Reset Hunk' },
    { '<leader>gt', group = 'Toggle' },
    { '<leader>gtb', '<cmd>Gitsigns toggle_current_line_blame<cr>', desc = 'Blame' },
    { '<leader>gtd', '<cmd>Gitsigns toggle_deleted<cr>', desc = 'Deleted' },
    { '<leader>gtl', '<cmd>Gitsigns toggle_linehl<cr>', desc = 'Line HL' },
    { '<leader>gtn', '<cmd>Gitsigns toggle_numhl<cr>', desc = 'Number HL' },
    { '<leader>gts', '<cmd>Gitsigns toggle_signs<cr>', desc = 'Signs' },
    { '<leader>gtw', '<cmd>Gitsigns toggle_word_diff<cr>', desc = 'Word Diff' },
    { '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<cr>', desc = 'Undo Stage Hunk' },
    { '<leader>gv', '<cmd>Gitsigns select_hunk<cr>', desc = 'Select Hunk' },
    { '<leader>gw', '<cmd>lua require("snacks").gitbrowse()<cr>', desc = 'Git Browse' },
    {
        '<leader>gl',
        function()
            Snacks.picker.git_log()
        end,
        desc = 'Git Log',
    },
    {
        '<leader>gL',
        function()
            Snacks.picker.git_log_line()
        end,
        desc = 'Git Log Line',
    },
    {
        '<leader>gs',
        function()
            Snacks.picker.git_branches()
        end,
        desc = 'Git Branches',
    },
    {
        '<leader>gS',
        function()
            Snacks.picker.git_stash()
        end,
        desc = 'Git Stash',
    },
    {
        '<leader>gd',
        function()
            Snacks.picker.git_diff()
        end,
        desc = 'Git Diff (Hunks)',
    },

    { '<leader>i', group = ' Insert' },
    { '<leader>iP', '<cmd>put %:p<cr>', desc = 'Absolute Path' },
    { '<leader>id', "<cmd>put =strftime('## %a, %d %b, %Y, %r')<cr>", desc = 'Date' },
    { '<leader>if', "<cmd>put =expand('%:t')<cr>", desc = 'File Name' },
    { '<leader>in', '<cmd>Nerdy<cr>', desc = 'Nerd Glyphs' },
    { '<leader>ip', '<cmd>put %<cr>', desc = 'Relative Path' },
    { '<leader>it', "<cmd>put =strftime('## %r')<cr>", desc = 'Time' },
    {
        '<leader>ii',
        function()
            Snacks.picker.icons()
        end,
        desc = 'Icons',
    },
    {
        '<leader>ir',
        function()
            Snacks.picker.registers()
        end,
        desc = 'Registers',
    },

    { '<leader>j', group = ' Jump' },
    { '<leader>jc', '*', desc = 'Word' },
    { '<leader>jd', '<cmd>FlashDiagnostics<cr>', desc = 'Diagnostics' },
    { '<leader>jh', '<C-o>', desc = 'Backward' },
    { '<leader>jj', "<cmd>lua require('flash').remote()<cr>", desc = 'Remote' },
    { '<leader>jk', "<cmd>lua require('flash').treesitter()<cr>", desc = 'Treesitter' },
    { '<leader>jl', '<C-i>', desc = 'Forward' },
    { '<leader>jp', "<cmd>lua require('flash').jump({continue = true})<cr>", desc = 'Previous Jump' },
    { '<leader>js', "<cmd>lua require('flash').jump()<cr>", desc = 'Search' },
    { '<leader>jt', "<cmd>lua require('flash').treesitter_search()<cr>", desc = 'Remote Treesitter' },
    {
        '<leader>jf',
        function()
            Snacks.picker.jumps()
        end,
        desc = 'Jumps',
    },
    {
        '<leader>jn',
        "<cmd>lua require('flash').jump({search = { forward = true, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Forward',
    },
    {
        '<leader>jN',
        "<cmd>lua require('flash').jump({search = { forward = false, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Backward',
    },
    {
        '<leader>jw',
        '<cmd>lua require("flash").jump({ pattern = vim.fn.expand("<cword>")})<cr>',
        desc = 'Current Word',
    },

    { '<leader>l', group = ' LSP' },
    { '<leader>la', '<cmd>Lspsaga code_action<cr>', desc = 'Code Action' },
    { '<leader>lf', '<cmd>Lspsaga finder<cr>', desc = 'Finder' },
    { '<leader>lh', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover' },
    { '<leader>lI', '<cmd>LspInfo<cr>', desc = 'LSP Info' },
    { '<leader>lj', '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = 'Next Diagnostic' },
    { '<leader>lk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = 'Prev Diagnostic' },
    { '<leader>lo', '<cmd>Lspsaga outline<cr>', desc = 'Outline' },
    { '<leader>lp', '<cmd>Lspsaga peek_definition<cr>', desc = 'Peek Definition' },
    { '<leader>lq', '<cmd>LspStop<cr>', desc = 'Stop LSP' },
    { '<leader>lQ', '<cmd>LspRestart<cr>', desc = 'Restart LSP' },
    { '<leader>lr', '<cmd>Lspsaga rename<cr>', desc = 'Rename' },
    { '<leader>lR', '<cmd>Lspsaga project_replace<cr>', desc = 'Replace' },
    { '<leader>lP', '<cmd>Lspsaga peek_type_definition<cr>', desc = 'Peek Type Definition' },
    {
        '<leader>ld',
        function()
            Snacks.picker.lsp_definitions()
        end,
        desc = 'Goto Definition',
    },
    {
        '<leader>lD',
        function()
            Snacks.picker.lsp_declarations()
        end,
        desc = 'Goto Declaration',
    },
    {
        '<leader>lF',
        function()
            Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = 'References',
    },
    {
        '<leader>li',
        function()
            Snacks.picker.lsp_implementations()
        end,
        desc = 'Goto Implementation',
    },
    {
        '<leader>ll',
        function()
            Snacks.picker.diagnostics_buffer()
        end,
        desc = 'Buffer Diagnostics',
    },
    {
        '<leader>lL',
        function()
            Snacks.picker.diagnostics()
        end,
        desc = 'Diagnostics',
    },
    {
        '<leader>ls',
        function()
            Snacks.picker.lsp_symbols()
        end,
        desc = 'LSP Symbols',
    },
    {
        '<leader>lS',
        function()
            Snacks.picker.lsp_workspace_symbols()
        end,
        desc = 'LSP Workspace Symbols',
    },
    {
        '<leader>lt',
        function()
            Snacks.picker.lsp_type_definitions()
        end,
        desc = 'Goto Type Definition',
    },

    { '<leader>m', group = ' Marks' },
    {
        '<leader>mb',
        "<cmd>lua require('telescope').extensions.markit.bookmarks_list_all()<cr>",
        desc = 'Bookmarks',
    },
    {
        '<leader>mB',
        "<cmd>lua require('telescope').extensions.markit.bookmarks_list_all({project_only = true})<cr>",
        desc = 'Bookmarks In Project',
    },
    { '<leader>md', "<cmd>lua require('markit').delete_line()<cr>", desc = 'Delete Marks In Line' },
    { '<leader>mD', "<cmd>lua require('markit').delete_buf()<cr>", desc = 'Delete Marks In Buffer' },
    { '<leader>mg', group = 'Group Bookmarks' },
    { '<leader>mG', group = 'Group Bookmarks In Project' },
    { '<leader>mh', "<cmd>lua require('markit').prev_bookmark()<cr>", desc = 'Previous Bookmark' },
    { '<leader>mj', "<cmd>lua require('markit').next()<cr>", desc = 'Next' },
    { '<leader>mk', "<cmd>lua require('markit').prev()<cr>", desc = 'Previous' },
    { '<leader>ml', "<cmd>lua require('markit').next_bookmark()<cr>", desc = 'Next Bookmark' },
    --   { '<leader>mm', '<cmd>Telescope markit<cr>', desc = 'All Marks' },
    {
        '<leader>mm',
        function()
            Snacks.picker.marks()
        end,
        desc = 'Marks',
    },
    { '<leader>mn', group = 'Next Bookmark In Group' },
    { '<leader>mp', group = 'Previous Bookmark In Group' },
    { '<leader>mP', "<cmd>lua require('markit').preview()<cr>", desc = 'Preview' },
    { '<leader>ms', "<cmd>lua require('markit').set_next()<cr>", desc = 'Set Next' },
    { '<leader>mt', "<cmd>lua require('markit').toggle()<cr>", desc = 'Toggle' },
    { '<leader>mx', "<cmd>lua require('markit').delete_bookmark()<cr>", desc = 'Delete Bookmark' },

    { '<leader>n', group = ' Notes' },
    { '<leader>na', '<cmd>lua require("snacks").scratch.select()<cr>', desc = 'Select Scratch' },
    {
        '<leader>nc',
        '<cmd>lua require("tdo").run_with("commit " .. vim.fn.expand("%:p")) vim.notify("Committed!")<cr>',
        desc = 'Commit Note',
    },
    { '<leader>nd', '<cmd>Tdo<cr>', desc = "Today's Todo" },
    { '<leader>ne', '<cmd>TdoEntry<cr>', desc = "Today's Entry" },
    { '<leader>nf', '<cmd>TdoFiles<cr>', desc = 'All Notes' },
    { '<leader>ng', '<cmd>TdoFind<cr>', desc = 'Find Notes' },
    { '<leader>nh', '<cmd>Tdo -1<cr>', desc = "Yesterday's Todo" },
    { '<leader>nl', '<cmd>Tdo 1<cr>', desc = "Tomorrow's Todo" },
    { '<leader>nn', '<cmd>TdoNote<cr>', desc = 'New Note' },
    { '<leader>np', group = 'Past Todos' },
    { '<leader>ns', '<cmd>lua require("snacks").scratch()<cr>', desc = 'New Scratch' },
    { '<leader>nt', '<cmd>TdoTodos<cr>', desc = 'Incomplete Todos' },
    { '<leader>nx', '<cmd>TdoToggle<cr>', desc = 'Toggle Todo' },

    { '<leader>o', group = ' Options' },
    { '<leader>oi', 'vim.show_pos', desc = 'Inspect Position' },
    { '<leader>ok', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover Doc' },
    { '<leader>or', '<cmd>set relativenumber!<cr>', desc = 'Relative Numbers' },
    {
        '<leader>oa',
        function()
            Snacks.picker.autocmds()
        end,
        desc = 'Autocmds',
    },
    {
        '<leader>oc',
        function()
            Snacks.picker.command_history()
        end,
        desc = 'Command History',
    },
    {
        '<leader>od',
        function()
            Snacks.picker.help()
        end,
        desc = 'Docs',
    },
    {
        '<leader>og',
        function()
            Snacks.picker.commands()
        end,
        desc = 'Commands',
    },
    {
        '<leader>oh',
        function()
            Snacks.picker.highlights()
        end,
        desc = 'Highlights',
    },
    {
        '<leader>ok',
        function()
            Snacks.picker.keymaps()
        end,
        desc = 'Keymaps',
    },
    {
        '<leader>om',
        function()
            Snacks.picker.man()
        end,
        desc = 'Man Pages',
    },
    {
        '<leader>on',
        function()
            Snacks.picker.notifications()
        end,
        desc = 'Notification History',
    },
    {
        '<leader>os',
        function()
            Snacks.picker.search_history()
        end,
        desc = 'Search History',
    },
    {
        '<leader>ot',
        function()
            Snacks.picker.colorschemes()
        end,
        desc = 'Colorschemes',
    },

    { '<leader>p', group = ' Packages' },
    { '<leader>pc', '<cmd>Lazy check<cr>', desc = 'Check' },
    { '<leader>pd', '<cmd>Lazy debug<cr>', desc = 'Debug' },
    { '<leader>pe', '<cmd>lua require("snacks").profiler.scratch()<cr>', desc = 'Profiler Scratch' },
    { '<leader>pf', '<cmd>lua require("snacks").profiler.pick()<cr>', desc = 'Profiler Pick' },
    { '<leader>pi', '<cmd>Lazy install<cr>', desc = 'Install' },
    { '<leader>pl', '<cmd>Lazy log<cr>', desc = 'Log' },
    { '<leader>pm', '<cmd>Mason<cr>', desc = 'Mason' },
    { '<leader>pp', '<cmd>Lazy<cr>', desc = 'Plugins' },
    { '<leader>pP', '<cmd>Lazy profile<cr>', desc = 'Profile' },
    { '<leader>pr', '<cmd>Lazy restore<cr>', desc = 'Restore' },
    { '<leader>ps', '<cmd>Lazy sync<cr>', desc = 'Sync' },
    { '<leader>pt', '<cmd>lua require("snacks").profiler.toggle()<cr>', desc = 'Profiler Toggle' },
    { '<leader>pu', '<cmd>Lazy update<cr>', desc = 'Update' },
    { '<leader>px', '<cmd>Lazy clean<cr>', desc = 'Clean' },
    {
        '<leader>pS',
        function()
            Snacks.picker.lazy()
        end,
        desc = 'Search for Plugin Spec',
    },

    { '<leader>q', group = ' Quit' },
    { '<leader>qa', '<cmd>qall<cr>', desc = 'Quit All' },
    { '<leader>qb', '<cmd>bw<cr>', desc = 'Close Buffer' },
    { '<leader>qd', '<cmd>lua require("snacks").bufdelete()<cr>', desc = 'Delete Buffer' },
    { '<leader>qf', '<cmd>qall!<cr>', desc = 'Force Quit' },
    { '<leader>qo', ':%bdelete|b#|bdelete#<cr>', desc = 'Close Others' },
    { '<leader>qq', '<cmd>q<cr>', desc = 'Quit' },
    { '<leader>qs', '<C-w>c', desc = 'Close Split' },
    { '<leader>qw', '<cmd>wq<cr>', desc = 'Write and Quit' },

    { '<leader>r', group = ' Refactor' },
    { '<leader>rb', "<cmd>lua require('spectre').open_file_search()<cr>", desc = 'Replace Buffer' },
    { '<leader>ri', "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = 'Inline Variable' },
    { '<leader>re', "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = 'Extract Block' },
    { '<leader>rs', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', desc = 'Replace Word' },
    { '<leader>rS', "<cmd>lua require('spectre').open()<cr>", desc = 'Replace' },
    { '<leader>rv', "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = 'Extract Variable' },
    { '<leader>rw', "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = 'Replace Word' },
    { '<leader>rd', '', desc = 'Go To Definition' }, -- treesitter navigation
    { '<leader>rh', '', desc = 'List Definition Head' },
    { '<leader>rj', '', desc = 'Next Usage' },
    { '<leader>rk', '', desc = 'Previous Usage' },
    { '<leader>rl', '', desc = 'List Definition' },
    { '<leader>rn', '', desc = 'Swap Next' },
    { '<leader>rp', '', desc = 'Swap Previous' },
    { '<leader>rr', '', desc = 'Smart Rename' },
    {
        '<leader>rf',
        "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
        desc = 'Extract To File',
    },

    { '<leader>s', group = ' Split' },
    { '<leader>s+', '<cmd>resize +10<cr>', desc = 'Increase window height' },
    { '<leader>s-', '<cmd>vertical resize -20<cr>', desc = 'Decrease window width' },
    { '<leader>s/', '<C-w>s', desc = 'Split Below' },
    { '<leader>s=', '<cmd>vertical resize +20<cr>', desc = 'Increase window width' },
    { '<leader>sH', '<cmd>vertical resize -10<cr>', desc = 'Decrease window width' },
    { '<leader>sJ', '<cmd>resize -5<cr>', desc = 'Decrease window height' },
    { '<leader>sK', '<cmd>resize +5<cr>', desc = 'Increase window height' },
    { '<leader>sL', '<cmd>vertical resize +10<cr>', desc = 'Increase window width' },
    { '<leader>s\\', '<C-w>v', desc = 'Split Right' },
    { '<leader>s_', '<cmd>resize -10<cr>', desc = 'Decrease window height' },
    { '<leader>s`', '<C-w>p', desc = 'Previous Window' },
    { '<leader>sa', '<cmd>split<cr>', desc = 'Horizontal Split' },
    { '<leader>sc', '<cmd>tabclose<cr>', desc = 'Close Tab' },
    { '<leader>sf', '<cmd>tabfirst<cr>', desc = 'First Tab' },
    { '<leader>sh', '<C-w>h', desc = 'Move Left' },
    { '<leader>sj', '<C-w>j', desc = 'Move Down' },
    { '<leader>sk', '<C-w>k', desc = 'Move Up' },
    { '<leader>sl', '<C-w>l', desc = 'Move Right' },
    { '<leader>sp', '<cmd>NavigatorPrevious<cr>', desc = 'Previous Pane' },
    { '<leader>sq', '<C-w>c', desc = 'Close Split' },
    { '<leader>ss', '<cmd>vsplit<cr>', desc = 'Vertical Split' },

    { '<leader>t', group = ' Terminal' },
    { '<leader>t`', '<cmd>Sterm<cr>', desc = 'Horizontal Terminal' },
    { '<leader>tc', '<cmd>Sterm bundle exec rails console<cr>', desc = 'Rails Console' },
    { '<leader>td', '<cmd>Sterm dexe<cr>', desc = 'Exe Launcher' },
    { '<leader>tn', '<cmd>Sterm node<cr>', desc = 'Node' },
    { '<leader>tp', '<cmd>Sterm bpython<cr>', desc = 'Python' },
    { '<leader>tr', '<cmd>Sterm irb<cr>', desc = 'Ruby' },
    { '<leader>ts', '<cmd>Sterm<cr>', desc = 'Horizontal Terminal' },
    { '<leader>tt', '<cmd>Fterm<cr>', desc = 'Terminal' },
    { '<leader>tv', '<cmd>Vterm<cr>', desc = 'Vertical Terminal' },
    { '<leader>tw', '<cmd>Sterm dexe --wait-before-exit<cr>', desc = 'Exe Launcher, Wait' },

    { '<leader>w', group = ' Writing' },
    { '<leader>wc', '<cmd>set spell!<cr>', desc = 'Spellcheck' },
    { '<leader>wd', '<cmd>lua require("snacks").dim.enable()<cr>', desc = 'Dim On' },
    { '<leader>wD', '<cmd>lua require("snacks").dim.disable()<cr>', desc = 'Dim Off' },
    { '<leader>wf', "<cmd>lua require'utils'.sudo_write()<cr>", desc = 'Force Write' },
    { '<leader>wj', ']s', desc = 'Next Misspell' },
    { '<leader>wk', '[s', desc = 'Prev Misspell' },
    { '<leader>wn', '<cmd>WriteNoFormat<cr>', desc = 'Write Without Formatting' },
    { '<leader>wq', '<cmd>wq<cr>', desc = 'Write and Quit' },
    { '<leader>ww', '<cmd>w<cr>', desc = 'Write' },
    { '<leader>wz', '<cmd>lua require("snacks").zen.zen()<cr>', desc = 'Zen' },
    { '<leader>wZ', '<cmd>lua require("snacks").zen.zoom()<cr>', desc = 'Zoom' },
    { '<leader>x', '<cmd>x<cr>', desc = ' Save and Quit' },

    { '<leader>y', group = ' Yank' },
    { '<leader>yL', '<cmd>CopyAbsolutePathWithLine<cr>', desc = 'Absolute Path with Line' },
    { '<leader>yP', '<cmd>CopyAbsolutePath<cr>', desc = 'Absolute Path' },
    { '<leader>ya', '<cmd>%y+<cr>', desc = 'Copy Whole File' },
    { '<leader>yf', '<cmd>CopyFileName<cr>', desc = 'File Name' },
    { '<leader>yg', '<cmd>lua require"gitlinker".get_buf_range_url()<cr>', desc = 'Copy Git URL' },
    { '<leader>yl', '<cmd>CopyRelativePathWithLine<cr>', desc = 'Relative Path with Line' },
    { '<leader>yp', '<cmd>CopyRelativePath<cr>', desc = 'Relative Path' },
}

-- Numerical mappings
for i = 1, 9 do
    table.insert(normal_mappings, {
        string.format('<leader>n%d', i),
        string.format('<cmd>Tdo %d<cr>', i),
        desc = string.format('Todo %d Days In Future', i),
    })

    table.insert(normal_mappings, {
        string.format('<leader>np%d', i),
        string.format('<cmd>Tdo -%d<cr>', i),
        desc = string.format('Todo %d Days From Past', i),
    })

    table.insert(normal_mappings, {
        string.format('<leader>f%d', i),
        string.format('<cmd>LualineBuffersJump%d<cr>', i),
        desc = string.format('File %d', i),
    })

    table.insert(normal_mappings, {
        string.format('<leader>m%d', i),
        string.format('<cmd>lua require("markit").toggle_bookmark%d()<cr>', i),
        desc = string.format('Toggle Group %d Bookmark', i),
    })

    table.insert(normal_mappings, {
        string.format('<leader>mp%d', i),
        string.format('<cmd>lua require("markit").prev_bookmark%d()<cr>', i),
        desc = string.format('Previous Group %d Bookmarks', i),
    })

    table.insert(normal_mappings, {
        string.format('<leader>mn%d', i),
        string.format('<cmd>lua require("markit").next_bookmark%d()<cr>', i),
        desc = string.format('Next Group %d Bookmarks', i),
    })

    table.insert(normal_mappings, {
        string.format('<leader>mg%d', i),
        string.format('<cmd>lua require("telescope").extensions.markit.bookmarks_list_all({group = %d})<cr>', i),
        desc = string.format('Group %d Bookmarks', i),
    })

    table.insert(normal_mappings, {
        string.format('<leader>mG%d', i),
        string.format(
            '<cmd>lua require("telescope").extensions.markit.bookmarks_list_all({group = %d, project_only = true})<cr>',
            i
        ),
        desc = string.format('Group %d Bookmarks In Project', i),
    })
end

local visual_mappings = {
    mode = 'v',
    { '<leader>a', group = ' AI' },
    { '<leader>aF', '<cmd>CopilotChatFixDiagnostic<cr>', desc = 'Fix Diagnostic' },
    { '<leader>aG', '<cmd>CopilotChatCommitStaged<cr>', desc = 'Commit Staged' },
    { '<leader>ac', '<cmd>CopilotChatToggle<cr>', desc = 'Copilot Chat' },
    { '<leader>ad', '<cmd>CopilotChatDocs<cr>', desc = 'Docs' },
    { '<leader>ae', '<cmd>CopilotChatExplain<cr>', desc = 'Explain' },
    { '<leader>af', '<cmd>CopilotChatFix<cr>', desc = 'Fix' },
    { '<leader>ag', '<cmd>CopilotChatCommit<cr>', desc = 'Commit' },
    { '<leader>ao', '<cmd>CopilotChatOptimize<cr>', desc = 'Optimize' },
    { '<leader>ar', '<cmd>CopilotChatReview<cr>', desc = 'Review' },
    { '<leader>at', '<cmd>CopilotChatTests<cr>', desc = 'Tests' },

    { '<leader>c', group = ' Code' },
    { '<leader>ce', "<esc><cmd>'<,'>SnipRun<cr>", desc = 'Execute Selection' },
    { '<leader>cS', ':sort!<cr>', desc = 'Sort Desc' },
    { '<leader>ci', ':sort i<cr>', desc = 'Sort Case Insensitive' },
    { '<leader>cs', ':sort<cr>', desc = 'Sort Asc' },
    { '<leader>cu', ':!uniq<cr>', desc = 'Unique' },
    { '<leader>cx', ':lua<cr>', desc = 'Execute Lua' },

    { '<leader>g', group = ' Git' },
    { '<leader>ga', ":'<,'>Gitsigns stage_hunk<cr>", desc = 'Stage Hunk' },
    { '<leader>gr', ":'<,'>Gitsigns reset_hunk<cr>", desc = 'Reset Hunk' },
    { '<leader>gu', ":'<,'>Gitsigns undo_stage_hunk<cr>", desc = 'Undo Stage Hunk' },

    { '<leader>j', group = ' Jump' },
    {
        '<leader>jN',
        "<cmd>lua require('flash').jump({search = { forward = false, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Backward',
    },
    { '<leader>jd', '<cmd>FlashDiagnostics<cr>', desc = 'Diagnostics' },
    { '<leader>jj', "<cmd>lua require('flash').remote()<cr>", desc = 'Remote' },
    { '<leader>jk', "<cmd>lua require('flash').treesitter()<cr>", desc = 'Treesitter' },
    {
        '<leader>jn',
        "<cmd>lua require('flash').jump({search = { forward = true, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Forward',
    },
    { '<leader>jp', "<cmd>lua require('flash').jump({continue = true})<cr>", desc = 'Previous Jump' },
    { '<leader>js', "<cmd>lua require('flash').jump()<cr>", desc = 'Search' },
    { '<leader>jt', "<cmd>lua require('flash').treesitter_search()<cr>", desc = 'Remote Treesitter' },
    {
        '<leader>jw',
        '<cmd>lua require("flash").jump({ pattern = vim.fn.expand("<cword>")})<cr>',
        desc = 'Current Word',
    },

    { '<leader>l', group = ' LSP' },
    { '<leader>la', desc = '<cmd><C-U>Lspsaga range_code_action<CR>' },

    { '<leader>r', group = ' Refactor' },
    {
        '<leader>re',
        "<esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>",
        desc = 'Extract Function',
    },
    {
        '<leader>rf',
        "<esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
        desc = 'Extract To File',
    },
    { '<leader>ri', "<esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = 'Inline Variable' },
    {
        '<leader>rv',
        "<esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
        desc = 'Extract Variable',
    },

    { '<leader>y', group = ' Yank' },
    { '<leader>yg', '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', desc = 'Copy Git URL' },
}

local no_leader_mappings = {
    mode = 'n',
    { '<C-Down>', '<cmd>resize -10<cr>', desc = 'Decrease window height' },
    { '<C-Left>', '<cmd>vertical resize -10<cr>', desc = 'Decrease window width' },
    { '<C-Right>', '<cmd>vertical resize +10<cr>', desc = 'Increase window width' },
    { '<C-Up>', '<cmd>resize +10<cr>', desc = 'Increase window height' },
    { '<C-g>', '<cmd>Fterm lazygit<cr>', desc = 'Lazygit' },
    {
        '<C-f>',
        function()
            Snacks.picker.smart()
        end,
        desc = 'Smart Find Files',
    },

    { '<C-h>', '<C-w>h', desc = 'Move Left' },
    { '<C-j>', '<C-w>j', desc = 'Move Down' },
    { '<C-k>', '<C-w>k', desc = 'Move Up' },
    { '<C-l>', '<C-w>l', desc = 'Move Right' },
    { '<C-\\>', '<C-w>p', desc = 'Previous Pane' },

    { '<S-h>', '<cmd>bprevious<cr>', desc = 'Previous Buffer' },
    { '<S-l>', '<cmd>bnext<cr>', desc = 'Next Buffer' },

    { 'K', '<cmd>Lspsaga hover_doc<cr>', desc = 'LSP Hover' },
    { 'Q', '<cmd>qall!<cr>', desc = 'Force Quit!' },
    { 'U', '<cmd>redo<cr>', desc = 'Redo' },

    { '[', group = ' Previous' },
    { '[g', '<cmd>Gitsigns prev_hunk<cr>', desc = 'Git Hunk' },
    { '[o', group = 'Textobjects' },

    { ']', group = ' Next' },
    { ']g', '<cmd>Gitsigns next_hunk<cr>', desc = 'Git Hunk' },
    { ']o', group = 'Textobjects' },
}

local tmux_mappings = {
    { '<C-h>', '<cmd>NavigatorLeft<cr>', desc = 'Move Left' },
    { '<C-j>', '<cmd>NavigatorDown<cr>', desc = 'Move Down' },
    { '<C-k>', '<cmd>NavigatorUp<cr>', desc = 'Move Up' },
    { '<C-l>', '<cmd>NavigatorRight<cr>', desc = 'Move Right' },
    { '<C-\\>', '<cmd>NavigatorPrevious<cr>', desc = 'Previous Pane' },
}

if vim.fn.exists('$TMUX') == 1 then
    vim.tbl_extend('force', no_leader_mappings, tmux_mappings)
end

if util.get_user_config('enable_test_runner', false) then
    local test_runner_bindings = {
        { '<leader>u', group = ' Test' },
        { '<leader>uc', '<cmd>lua require("neotest").run.run()<cr>', desc = 'Run Current Test' },
        { '<leader>uf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = 'Run Test File' },
        { '<leader>uo', '<cmd>Neotest output-panel<cr>', desc = 'Test Output' },
        { '<leader>us', '<cmd>Neotest summary<cr>', desc = 'Test Summary' },
    }
    vim.tbl_extend('force', normal_mappings, test_runner_bindings)
end

if util.get_user_config('enable_db_explorer', false) then
    local db_explorer_bindings = {
        { '<leader>d', group = ' Database' },
        { '<leader>dS', '<cmd>lua require("dbee").store("json", "buffer", { extra_arg = 0 })<cr>', desc = 'To JSON' },
        { '<leader>db', '<cmd>DBToggle<cr>', desc = 'DB Explorer' },
        { '<leader>dj', '<cmd>lua require("dbee").next()<cr>', desc = 'DB Next' },
        { '<leader>dk', '<cmd>lua require("dbee").prev()<cr>', desc = 'DB Prev' },
        { '<leader>ds', '<cmd>lua require("dbee").store("csv", "buffer", { extra_arg = 0 })<cr>', desc = 'To CSV' },
        { '<leader>dt', '<cmd>lua require("dbee").store("table", "buffer", { extra_arg = 0 })<cr>', desc = 'To Table' },
    }
    vim.tbl_extend('force', normal_mappings, db_explorer_bindings)
end

if util.get_user_config('enable_debugger', false) then
    local debugger_bindings = {
        { '<leader>b', group = ' Debug' },
        { '<leader>bO', '<cmd>DapStepOut<cr>', desc = 'Out' },
        { '<leader>bR', '<cmd>DapRestartFrame<cr>', desc = 'Restart Frame' },
        { '<leader>bb', '<cmd>DapToggleBreakpoint<cr>', desc = 'Breakpoint' },
        { '<leader>bc', '<cmd>DapContinue<cr>', desc = 'Continue' },
        { '<leader>bi', '<cmd>DapStepInto<cr>', desc = 'Into' },
        { '<leader>bl', "<cmd>lua require'dap'.run_last()<cr>", desc = 'Last' },
        { '<leader>bo', '<cmd>DapStepOver<cr>', desc = 'Over' },
        { '<leader>br', '<cmd>DapToggleRepl<cr>', desc = 'Repl' },
        { '<leader>bt', '<cmd>DapUIToggle<cr>', desc = 'Debugger' },
        { '<leader>bx', '<cmd>DapTerminate<cr>', desc = 'Exit' },
    }
    vim.tbl_extend('force', normal_mappings, debugger_bindings)
end

local user_keybindings = require('lib.util').get_user_config('user_keybindings', {})

which_key.setup(setup)
which_key.add(normal_mappings)
which_key.add(visual_mappings)
which_key.add(no_leader_mappings)
which_key.add(user_keybindings)
