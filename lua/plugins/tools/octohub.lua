local octohub = require('octohub')

octohub.setup({
    per_user_dir = true,
    projects_dir = '~/Projects/',
    contrib_icons = { '', '', '', '', '', '', '' },
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
    repo_cache_timeout = 3600 * 24,
    username_cache_timeout = 3600 * 24 * 7,
    events_cache_timeout = 60 * 30,
    contibutions_cache_timeout = 3600 * 4,
    user_cache_timeout = 3600 * 24 * 7,
    add_default_keybindings = true,
})
