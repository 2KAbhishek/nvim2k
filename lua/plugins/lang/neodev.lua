local neodev = require('neodev')

neodev.setup({
    library = {
        enabled = true,
        runtime = true,
        types = true,
        plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    },
    setup_jsonls = true,
    lspconfig = true,
    pathStrict = true,
})
