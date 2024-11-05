local octohub = require('octohub')

octohub.setup({
    per_user_dir = true,
    projects_dir = '~/Projects/',
    contribution_icons = { '', '', '', '', '', '', '' },
    sort_repos_by = '',
    repo_type = '',
    max_contributions = 50,
    top_lang_count = 5,
    event_count = 5,
    window_width = 90,
    window_height = 60,
    show_recent_activity = true,
    show_contributions = true,
    show_repo_stats = true,
    add_default_keybindings = true,
})
