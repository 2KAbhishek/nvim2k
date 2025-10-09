local sidekick = require('sidekick')

sidekick.setup({
    cli = {
        mux = {
            backend = 'tmux',
            enabled = true,
            create = 'split',
        },
    },
})
