local which_key = require('which-key')
local icons = require('lib.icons')
local util = require('lib.util')
local prompts = require('lib.prompts')

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
        { '<auto>', mode = 'nvisoct' },
        { '<leader>', mode = { 'n', 'v' } },
    },
}

local normal_mappings = {
    mode = 'n',
    { '<leader>x', ':x<cr>', desc = ' Save and Quit' },

    { '<leader>a', group = ' AI' },
    { '<leader>aC', ':AvanteClear<cr>', desc = 'avante: clear' },
    { '<leader>am', ':MCPHub<cr>', desc = 'MCPHub' },
    { '<leader>an', ':AvanteChatNew<cr>', desc = 'avante: new' },
    { '<leader>ap', group = 'Insert Prompt' },
    { '<leader>apd', prompts.add_prompt('docs'), desc = 'Docs' },
    { '<leader>ape', prompts.add_prompt('explain'), desc = 'Explain' },
    { '<leader>apf', prompts.add_prompt('fix'), desc = 'Fix' },
    { '<leader>apg', prompts.add_prompt('commit'), desc = 'Commit' },
    { '<leader>apo', prompts.add_prompt('optimize'), desc = 'Optimize' },
    { '<leader>apr', prompts.add_prompt('review'), desc = 'Review' },
    { '<leader>apt', prompts.add_prompt('tests'), desc = 'Tests' },

    { '<leader>c', group = ' Code' },
    { '<leader>cF', ':retab<cr>', desc = 'Fix Tabs' },
    { '<leader>cP', ':CccConvert<cr>', desc = 'Convert Color' },
    { '<leader>cR', ':ReloadConfig<cr>', desc = 'Reload Configs' },
    { '<leader>cc', ':CccHighlighterToggle<cr>', desc = 'Highlight Colors' },
    { '<leader>cd', ':RootDir<cr>', desc = 'Root Directory' },
    { '<leader>ce', ':%SnipRun<cr>', desc = 'Execute File' },
    { '<leader>cf', ':lua vim.lsp.buf.format({async = true})<cr>', desc = 'Format File' },
    { '<leader>cl', '::g/^\\s*$/d<cr>', desc = 'Clean Empty Lines' },
    { '<leader>cm', ':MarkdownPreviewToggle<cr>', desc = 'Markdown Preview' },
    { '<leader>co', ':Dashboard<cr>', desc = 'Dashboard' },
    { '<leader>cp', ':CccPick<cr>', desc = 'Pick Color' },
    { '<leader>cs', ':source %<cr>', desc = 'Source File' },

    { '<leader>e', group = ' Edit' },
    { '<leader>ea', ':b#<cr>', desc = 'Alternate File' },
    { '<leader>ec', group = 'Edit Configs' },
    { '<leader>eca', ':e ~/.config/shell/aliases.sh<cr>', desc = 'Shell Aliases' },
    { '<leader>ecA', ':e ~/.config/alacritty/alacritty.toml<cr>', desc = 'Alacritty Config' },
    { '<leader>ecb', ':e ~/.bashrc<cr>', desc = 'Bash Config' },
    { '<leader>ece', ':e ~/.config/shell/environment.sh<cr>', desc = 'Environment Config' },
    { '<leader>ecf', ':e ~/.config/shell/functions.sh<cr>', desc = 'Shell Functions' },
    { '<leader>ecg', ':e ~/.gitconfig<cr>', desc = 'Git Config' },
    { '<leader>eck', ':e ~/.config/kitty/kitty.conf<cr>', desc = 'Kitty Config' },
    { '<leader>ecl', ':e ~/.config/shell/local.sh<cr>', desc = 'Local Env' },
    { '<leader>ecn', ':e $MYVIMRC<cr>', desc = 'Neovim Init' },
    { '<leader>ecp', ':e ~/.config/nvim/lua/plugins/list.lua<cr>', desc = 'Plugin List' },
    { '<leader>ecq', ':e ~/.config/qutebrowser/config.py<cr>', desc = 'Qutebrowser Config' },
    { '<leader>ect', ':e ~/.config/tmux/tmux.conf<cr>', desc = 'Tmux Config' },
    { '<leader>ecv', ':e ~/.vimrc<cr>', desc = 'Vim Config' },
    { '<leader>ecz', ':e $ZDOTDIR/.zshrc<cr>', desc = 'Zsh Config' },
    { '<leader>ecZ', ':e $ZDOTDIR/prompt/init.zsh<cr>', desc = 'Zsh Prompt Config' },
    { '<leader>eE', ':lua Snacks.explorer()<cr>', desc = 'File Explorer' },
    { '<leader>et', ':lua MiniFiles.open()<cr>', desc = 'Explore Tree' },
    { '<leader>ef', 'gf', desc = 'File Under Cursor' },
    { '<leader>em', ':e README.md<cr>', desc = 'Readme' },
    { '<leader>en', ':enew<cr>', desc = 'New File' },

    { '<leader>f', group = ' Find' },
    { '<leader>fx', ':%bd|e#|bd#<cr>', desc = 'Close except current' },

    { '<leader>g', group = ' Git' },
    { '<leader>gA', ':Gitsigns stage_buffer<cr>', desc = 'Stage Buffer' },
    { '<leader>gC', ':CoAuthor<cr>', desc = 'Co-Authors' },
    { '<leader>gP', ':Git push<cr>', desc = 'Push' },
    { '<leader>gR', ':Gitsigns reset_buffer<cr>', desc = 'Reset Buffer' },
    { '<leader>ga', ':Gitsigns stage_hunk<cr>', desc = 'Stage Hunk' },
    { '<leader>gb', ":lua require('gitsigns').blame_line({full = true})<cr>", desc = 'Blame' },
    { '<leader>gc', ':Git commit<cr>', desc = 'Commit Staged' },
    { '<leader>gB', ":lua require('snacks').git.blame_line()<cr>", desc = 'Detailed Blame' },
    { '<leader>gd', ':Gitsigns diffthis HEAD<cr>', desc = 'Git Diff' },
    { '<leader>gF', ':Git<cr>', desc = 'Fugitive Panel' },
    { '<leader>gg', ':lua require("snacks").lazygit()<cr>', desc = 'Lazygit' },
    { '<leader>gi', ':Gitsigns preview_hunk<cr>', desc = 'Hunk Info' },
    { '<leader>gj', ':Gitsigns next_hunk<cr>', desc = 'Next Hunk' },
    { '<leader>gk', ':Gitsigns prev_hunk<cr>', desc = 'Prev Hunk' },
    { '<leader>go', group = 'Octohub' },
    { '<leader>gp', ':Git pull<cr>', desc = 'Pull' },
    { '<leader>gr', ':Gitsigns reset_hunk<cr>', desc = 'Reset Hunk' },
    { '<leader>gt', group = 'Toggle' },
    { '<leader>gtb', ':Gitsigns toggle_current_line_blame<cr>', desc = 'Blame' },
    { '<leader>gtd', ':Gitsigns toggle_deleted<cr>', desc = 'Deleted' },
    { '<leader>gtl', ':Gitsigns toggle_linehl<cr>', desc = 'Line HL' },
    { '<leader>gtn', ':Gitsigns toggle_numhl<cr>', desc = 'Number HL' },
    { '<leader>gts', ':Gitsigns toggle_signs<cr>', desc = 'Signs' },
    { '<leader>gtw', ':Gitsigns toggle_word_diff<cr>', desc = 'Word Diff' },
    { '<leader>gu', ':Gitsigns undo_stage_hunk<cr>', desc = 'Undo Stage Hunk' },
    { '<leader>gv', ':Gitsigns select_hunk<cr>', desc = 'Select Hunk' },
    { '<leader>gw', ':lua require("snacks").gitbrowse()<cr>', desc = 'Git Browse' },

    { '<leader>i', group = ' Insert' },
    { '<leader>id', ":put =strftime('## %a, %d %b, %Y, %r')<cr>", desc = 'Date' },
    { '<leader>if', ":put =expand('%:t')<cr>", desc = 'File Name' },
    { '<leader>ip', ':put %<cr>', desc = 'Relative Path' },
    { '<leader>iP', ':put %:p<cr>', desc = 'Absolute Path' },
    { '<leader>it', ":put =strftime('## %r')<cr>", desc = 'Time' },

    { '<leader>j', group = ' Jump' },
    { '<leader>jc', '*', desc = 'Word' },
    { '<leader>jd', ':FlashDiagnostics<cr>', desc = 'Diagnostics' },
    { '<leader>jh', '<C-o>', desc = 'Backward' },
    { '<leader>jj', ":lua require('flash').remote()<cr>", desc = 'Remote' },
    { '<leader>jk', ":lua require('flash').treesitter()<cr>", desc = 'Treesitter' },
    { '<leader>jl', '<C-i>', desc = 'Forward' },
    { '<leader>jp', ":lua require('flash').jump({continue = true})<cr>", desc = 'Previous Jump' },
    { '<leader>js', ":lua require('flash').jump()<cr>", desc = 'Search' },
    { '<leader>jt', ":lua require('flash').treesitter_search()<cr>", desc = 'Remote Treesitter' },
    {
        '<leader>jn',
        ":lua require('flash').jump({search = { forward = true, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Forward',
    },
    {
        '<leader>jN',
        ":lua require('flash').jump({search = { forward = false, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Backward',
    },
    {
        '<leader>jw',
        ':lua require("flash").jump({ pattern = vim.fn.expand("<cword>")})<cr>',
        desc = 'Current Word',
    },

    { '<leader>l', group = ' LSP' },
    { '<leader>la', ':Lspsaga code_action<cr>', desc = 'Code Action' },
    { '<leader>ld', ':Lspsaga goto_definition<cr>', desc = 'Goto Definition' },
    { '<leader>lf', ':Lspsaga finder<cr>', desc = 'Finder' },
    { '<leader>lh', ':Lspsaga hover_doc<cr>', desc = 'Hover' },
    { '<leader>lI', ':LspInfo<cr>', desc = 'LSP Info' },
    { '<leader>lj', ':Lspsaga diagnostic_jump_next<cr>', desc = 'Next Diagnostic' },
    { '<leader>lk', ':Lspsaga diagnostic_jump_prev<cr>', desc = 'Prev Diagnostic' },
    { '<leader>lo', ':Lspsaga outline<cr>', desc = 'Outline' },
    { '<leader>lp', ':Lspsaga peek_definition<cr>', desc = 'Peek Definition' },
    { '<leader>lq', ':LspStop<cr>', desc = 'Stop LSP' },
    { '<leader>lQ', ':LspRestart<cr>', desc = 'Restart LSP' },
    { '<leader>lr', ':Lspsaga rename<cr>', desc = 'Rename' },
    { '<leader>lR', ':Lspsaga project_replace<cr>', desc = 'Replace' },
    { '<leader>lt', ':Lspsaga goto_type_definition<cr>', desc = 'Goto Type Definition' },
    { '<leader>lT', ':Lspsaga peek_type_definition<cr>', desc = 'Peek Type Definition' },

    { '<leader>m', group = ' Marks' },
    { '<leader>mg', group = 'Group Bookmarks' },
    { '<leader>mG', group = 'Group Bookmarks In Project' },
    { '<leader>mn', group = 'Next Bookmark In Group' },
    { '<leader>mp', group = 'Previous Bookmark In Group' },

    { '<leader>n', group = ' Notes' },
    { '<leader>na', ':lua Snacks.scratch.select()<cr>', desc = 'Select Scratch' },

    { '<leader>o', group = ' Options' },
    { '<leader>oi', 'vim.show_pos', desc = 'Inspect Position' },
    { '<leader>oN', ':lua Snacks.notifier.show_history()<cr>', desc = 'Notification History' },
    { '<leader>or', ':set relativenumber!<cr>', desc = 'Relative Numbers' },

    { '<leader>p', group = ' Packages' },
    { '<leader>pc', ':Lazy check<cr>', desc = 'Check' },
    { '<leader>pd', ':Lazy debug<cr>', desc = 'Debug' },
    { '<leader>pe', ':lua require("snacks").profiler.scratch()<cr>', desc = 'Profiler Scratch' },
    { '<leader>pf', ':lua require("snacks").profiler.pick()<cr>', desc = 'Profiler Pick' },
    { '<leader>pi', ':Lazy install<cr>', desc = 'Install' },
    { '<leader>pl', ':Lazy log<cr>', desc = 'Log' },
    { '<leader>pm', ':Mason<cr>', desc = 'Mason' },
    { '<leader>pp', ':Lazy<cr>', desc = 'Plugins' },
    { '<leader>pP', ':Lazy profile<cr>', desc = 'Profile' },
    { '<leader>pr', ':Lazy restore<cr>', desc = 'Restore' },
    { '<leader>ps', ':Lazy sync<cr>', desc = 'Sync' },
    { '<leader>pt', ':lua require("snacks").profiler.toggle()<cr>', desc = 'Profiler Toggle' },
    { '<leader>pu', ':Lazy update<cr>', desc = 'Update' },
    { '<leader>px', ':Lazy clean<cr>', desc = 'Clean' },

    { '<leader>q', group = ' Quit' },
    { '<leader>qa', ':qall<cr>', desc = 'Quit All' },
    { '<leader>qb', ':bw<cr>', desc = 'Close Buffer' },
    { '<leader>qd', ':lua require("snacks").bufdelete()<cr>', desc = 'Delete Buffer' },
    { '<leader>qf', ':qall!<cr>', desc = 'Force Quit' },
    { '<leader>qo', ':%bdelete|b#|bdelete#<cr>', desc = 'Close Others' },
    { '<leader>qq', ':q<cr>', desc = 'Quit' },
    { '<leader>qs', '<C-w>c', desc = 'Close Split' },
    { '<leader>qw', ':wq<cr>', desc = 'Write and Quit' },

    { '<leader>r', group = ' Refactor' },
    { '<leader>ra', ":lua require('spectre').open()<cr>", desc = 'Replace All' },
    { '<leader>rb', ":lua require('spectre').open_file_search()<cr>", desc = 'Replace Buffer' },
    { '<leader>rd', '', desc = 'Go To Definition' }, -- treesitter navigation
    { '<leader>rh', '', desc = 'List Definition Head' },
    { '<leader>rj', '', desc = 'Next Usage' },
    { '<leader>rk', '', desc = 'Previous Usage' },
    { '<leader>rl', '', desc = 'List Definition' },
    { '<leader>rn', '', desc = 'Swap Next' },
    { '<leader>rp', '', desc = 'Swap Previous' },
    { '<leader>rr', '', desc = 'Smart Rename' },
    { '<leader>rs', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', desc = 'Replace Word Buffer' },
    { '<leader>rw', ":lua require('spectre').open_visual({select_word=true})<cr>", desc = 'Replace Word Everywhere' },

    { '<leader>s', group = ' Split' },
    { '<leader>s+', ':resize +10<cr>', desc = 'Increase window height' },
    { '<leader>s-', ':vertical resize -20<cr>', desc = 'Decrease window width' },
    { '<leader>s/', '<C-w>s', desc = 'Split Below' },
    { '<leader>s=', ':vertical resize +20<cr>', desc = 'Increase window width' },
    { '<leader>sH', ':vertical resize -10<cr>', desc = 'Decrease window width' },
    { '<leader>sJ', ':resize -5<cr>', desc = 'Decrease window height' },
    { '<leader>sK', ':resize +5<cr>', desc = 'Increase window height' },
    { '<leader>sL', ':vertical resize +10<cr>', desc = 'Increase window width' },
    { '<leader>s\\', '<C-w>v', desc = 'Split Right' },
    { '<leader>s_', ':resize -10<cr>', desc = 'Decrease window height' },
    { '<leader>s`', '<C-w>p', desc = 'Previous Window' },
    { '<leader>sa', ':split<cr>', desc = 'Horizontal Split' },
    { '<leader>sc', ':tabclose<cr>', desc = 'Close Tab' },
    { '<leader>sf', ':tabfirst<cr>', desc = 'First Tab' },
    { '<leader>sh', '<C-w>h', desc = 'Move Left' },
    { '<leader>sj', '<C-w>j', desc = 'Move Down' },
    { '<leader>sk', '<C-w>k', desc = 'Move Up' },
    { '<leader>sl', '<C-w>l', desc = 'Move Right' },
    { '<leader>sp', ':NavigatorPrevious<cr>', desc = 'Previous Pane' },
    { '<leader>sq', '<C-w>c', desc = 'Close Split' },
    { '<leader>ss', ':vsplit<cr>', desc = 'Vertical Split' },

    { '<leader>t', group = ' Terminal' },
    { '<leader>t`', ':Sterm<cr>', desc = 'Horizontal Terminal' },
    { '<leader>tc', ':Sterm bundle exec rails console<cr>', desc = 'Rails Console' },
    { '<leader>td', ':Sterm dexe<cr>', desc = 'Exe Launcher' },
    { '<leader>tn', ':Sterm node<cr>', desc = 'Node' },
    { '<leader>tp', ':Sterm bpython<cr>', desc = 'Python' },
    { '<leader>tr', ':Sterm irb<cr>', desc = 'Ruby' },
    { '<leader>ts', ':Sterm<cr>', desc = 'Horizontal Terminal' },
    { '<leader>tt', ':Fterm<cr>', desc = 'Terminal' },
    { '<leader>tv', ':Vterm<cr>', desc = 'Vertical Terminal' },
    { '<leader>tw', ':Sterm dexe --wait-before-exit<cr>', desc = 'Exe Launcher, Wait' },

    { '<leader>w', group = ' Writing' },
    { '<leader>wc', ':set spell!<cr>', desc = 'Spellcheck' },
    { '<leader>wd', ':lua require("snacks").dim.enable()<cr>', desc = 'Dim On' },
    { '<leader>wD', ':lua require("snacks").dim.disable()<cr>', desc = 'Dim Off' },
    { '<leader>wf', ":lua require'utils'.sudo_write()<cr>", desc = 'Force Write' },
    { '<leader>wj', ']s', desc = 'Next Misspell' },
    { '<leader>wk', '[s', desc = 'Prev Misspell' },
    { '<leader>wn', ':WriteNoFormat<cr>', desc = 'Write Without Formatting' },
    { '<leader>wq', ':wq<cr>', desc = 'Write and Quit' },
    { '<leader>ww', ':w<cr>', desc = 'Write' },
    { '<leader>wz', ':lua require("snacks").zen.zen()<cr>', desc = 'Zen' },
    { '<leader>wZ', ':lua require("snacks").zen.zoom()<cr>', desc = 'Zoom' },

    { '<leader>y', group = ' Yank' },
    { '<leader>yL', ':CopyAbsolutePathWithLine<cr>', desc = 'Absolute Path with Line' },
    { '<leader>yP', ':CopyAbsolutePath<cr>', desc = 'Absolute Path' },
    { '<leader>ya', ':%y+<cr>', desc = 'Copy Whole File' },
    { '<leader>yf', ':CopyFileName<cr>', desc = 'File Name' },
    { '<leader>yg', ':lua require"gitlinker".get_buf_range_url()<cr>', desc = 'Copy Git URL' },
    { '<leader>yl', ':CopyRelativePathWithLine<cr>', desc = 'Relative Path with Line' },
    { '<leader>yp', ':CopyRelativePath<cr>', desc = 'Relative Path' },
}

-- Numerical mappings
for i = 1, 9 do
    table.insert(normal_mappings, {
        string.format('<leader>f%d', i),
        string.format(':LualineBuffersJump%d<cr>', i),
        desc = string.format('File %d', i),
    })
end

local visual_mappings = {
    mode = 'v',
    { '<leader>a', group = ' AI' },

    { '<leader>c', group = ' Code' },
    { '<leader>ce', "<esc>:'<,'>SnipRun<cr>", desc = 'Execute Selection' },
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
        ":lua require('flash').jump({search = { forward = false, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Backward',
    },
    { '<leader>jd', ':FlashDiagnostics<cr>', desc = 'Diagnostics' },
    { '<leader>jj', ":lua require('flash').remote()<cr>", desc = 'Remote' },
    { '<leader>jk', ":lua require('flash').treesitter()<cr>", desc = 'Treesitter' },
    {
        '<leader>jn',
        ":lua require('flash').jump({search = { forward = true, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Forward',
    },
    { '<leader>jp', ":lua require('flash').jump({continue = true})<cr>", desc = 'Previous Jump' },
    { '<leader>js', ":lua require('flash').jump()<cr>", desc = 'Search' },
    { '<leader>jt', ":lua require('flash').treesitter_search()<cr>", desc = 'Remote Treesitter' },
    {
        '<leader>jw',
        ':lua require("flash").jump({ pattern = vim.fn.expand("<cword>")})<cr>',
        desc = 'Current Word',
    },

    { '<leader>l', group = ' LSP' },
    { '<leader>la', ':<C-U>Lspsaga range_code_action<cr>', desc = 'Code Action' },

    { '<leader>y', group = ' Yank' },
    { '<leader>yg', ':lua require"gitlinker".get_buf_range_url("v")<cr>', desc = 'Copy Git URL' },
}

local no_leader_mappings = {
    mode = 'n',
    { '<C-Down>', ':resize -10<cr>', desc = 'Decrease window height' },
    { '<C-Left>', ':vertical resize -10<cr>', desc = 'Decrease window width' },
    { '<C-Right>', ':vertical resize +10<cr>', desc = 'Increase window width' },
    { '<C-Up>', ':resize +10<cr>', desc = 'Increase window height' },
    { '<C-g>', ':Fterm lazygit<cr>', desc = 'Lazygit' },

    { '<C-h>', ':NavigatorLeft<cr>', desc = 'Move Left' },
    { '<C-j>', ':NavigatorDown<cr>', desc = 'Move Down' },
    { '<C-k>', ':NavigatorUp<cr>', desc = 'Move Up' },
    { '<C-l>', ':NavigatorRight<cr>', desc = 'Move Right' },
    { '<C-\\>', ':NavigatorPrevious<cr>', desc = 'Previous Pane' },

    { '<S-h>', ':bprevious<cr>', desc = 'Previous Buffer' },
    { '<S-l>', ':bnext<cr>', desc = 'Next Buffer' },

    { 'K', ':Lspsaga hover_doc<cr>', desc = 'LSP Hover' },
    { 'Q', ':qall!<cr>', desc = 'Force Quit!' },
    { 'U', ':redo<cr>', desc = 'Redo' },

    { '[', group = ' Previous' },
    { '[g', ':Gitsigns prev_hunk<cr>', desc = 'Git Hunk' },
    { '[o', group = 'Textobjects' },

    { ']', group = ' Next' },
    { ']g', ':Gitsigns next_hunk<cr>', desc = 'Git Hunk' },
    { ']o', group = 'Textobjects' },

    { 'gd', ':Lspsaga goto_definition<cr>', desc = 'Goto Definition' },
}

which_key.setup(setup)
which_key.add(normal_mappings)
which_key.add(visual_mappings)
which_key.add(no_leader_mappings)

if util.get_user_config('enable_test_runner', false) then
    local test_runner_bindings = {
        mode = 'n',
        { '<leader>u', group = ' Test' },
        { '<leader>uc', ':lua require("neotest").run.run()<cr>', desc = 'Run Current Test' },
        { '<leader>uf', ':lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = 'Run Test File' },
        { '<leader>uo', ':Neotest output-panel<cr>', desc = 'Test Output' },
        { '<leader>us', ':Neotest summary<cr>', desc = 'Test Summary' },
    }
    which_key.add(test_runner_bindings)
end

if util.get_user_config('enable_db_explorer', false) then
    local db_explorer_bindings = {
        mode = 'n',
        { '<leader>d', group = ' Database' },
        { '<leader>dS', ':lua require("dbee").store("json", "buffer", { extra_arg = 0 })<cr>', desc = 'To JSON' },
        { '<leader>db', ':DBToggle<cr>', desc = 'DB Explorer' },
        { '<leader>dj', ':lua require("dbee").next()<cr>', desc = 'DB Next' },
        { '<leader>dk', ':lua require("dbee").prev()<cr>', desc = 'DB Prev' },
        { '<leader>ds', ':lua require("dbee").store("csv", "buffer", { extra_arg = 0 })<cr>', desc = 'To CSV' },
        { '<leader>dt', ':lua require("dbee").store("table", "buffer", { extra_arg = 0 })<cr>', desc = 'To Table' },
    }
    which_key.add(db_explorer_bindings)
end

if util.get_user_config('enable_debugger', false) then
    local debugger_bindings = {
        mode = 'n',
        { '<leader>b', group = ' Debug' },
        { '<leader>bO', ':DapStepOut<cr>', desc = 'Out' },
        { '<leader>bR', ':DapRestartFrame<cr>', desc = 'Restart Frame' },
        { '<leader>bb', ':DapToggleBreakpoint<cr>', desc = 'Breakpoint' },
        { '<leader>bc', ':DapContinue<cr>', desc = 'Continue' },
        { '<leader>bi', ':DapStepInto<cr>', desc = 'Into' },
        { '<leader>bl', ":lua require'dap'.run_last()<cr>", desc = 'Last' },
        { '<leader>bo', ':DapStepOver<cr>', desc = 'Over' },
        { '<leader>br', ':DapToggleRepl<cr>', desc = 'Repl' },
        { '<leader>bt', ':DapUIToggle<cr>', desc = 'Debugger' },
        { '<leader>bx', ':DapTerminate<cr>', desc = 'Exit' },
    }
    which_key.add(debugger_bindings)
end

local user_keybindings = require('lib.util').get_user_config('user_keybindings', {})
which_key.add(user_keybindings)
