local neotest = require('neotest')

neotest.setup({
    adapters = {
        require('neotest-rspec')({
            rspec_cmd = function()
                return vim.tbl_flatten({
                    'bundle',
                    'exec',
                    'rspec',
                })
            end,
        }),
        require('neotest-jest')({
            jestCommand = 'npx jest --',
            jestConfigFile = 'jest.config.js',
        }),
        require('neotest-python'),
    },
})
