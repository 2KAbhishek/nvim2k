local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then
    return
end

colorizer.setup({
    '*', -- Highlight all files, but customize some others.
    css = { css = true }, -- Enable parsing rgb(...) functions in css.
    scss = { css = true },
    sass = { css = true },
    less = { css = true },
    html = { css = true },
    jsx = { css = true },
    haml = { css = true },
    pug = { css = true },
    erb = { css = true },
})
