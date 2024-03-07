local dbee = require('dbee')

dbee.setup({
    sources = {
        require('dbee.sources').EnvSource:new('NVIM_DB'),
        -- require("dbee.sources").MemorySource:new({
        --     {
        --         name = "dbname",
        --         type = "postgres",
        --         url = "postgres://pguser:pguser@localhost:5602/dbname?sslmode=disable"
        --     },
        -- }),
        -- require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/config.json"),
    },
})

vim.api.nvim_create_user_command('DBToggle', function()
    require('dbee').toggle()
end, {})
