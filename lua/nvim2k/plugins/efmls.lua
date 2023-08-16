local status_ok, efmls = pcall(require, 'efmls-configs')
if not status_ok then
    return
end

local function on_attach(client)
    print('Attached to ' .. client.name)
end

efmls.init {
    -- Your custom attach function
    on_attach = on_attach,

    -- Enable formatting provided by efm langserver
    init_options = {
        documentFormatting = true,
    },
    default_config = true,
}

efmls.setup()
