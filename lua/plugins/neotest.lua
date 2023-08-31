local status_ok, neotest = pcall(require, 'neotest')
if not status_ok then
    return
end

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
    },
})
