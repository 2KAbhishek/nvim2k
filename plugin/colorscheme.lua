vim.cmd([[
    let g:onedark_color_overrides = {
    \ "comment_grey": {"gui": "#69747C","cterm": "245", "cterm16": "8"},
    \ "gutter_fg_grey": { "gui": "#69747C", "cterm": "245", "cterm16": "8"}
    \}
    if !exists('$TMUX')
        let g:onedark_terminal_italics = 1
    endif
    colorscheme onedark

    " Always use terminal background
    highlight Normal guibg=none
]])
