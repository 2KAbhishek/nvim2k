local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

local util = require "lspconfig.util"
local cmp_lsp = require "cmp_nvim_lsp"

---@param opts table|nil
local function create_capabilities(opts)
    local default_opts = {
        with_snippet_support = true,
    }
    opts = opts or default_opts
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = opts.with_snippet_support
    if opts.with_snippet_support then
        capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        }
    end
    return cmp_lsp.update_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
    if config.on_attach then
        config.on_attach = util.add_hook_after(config.on_attach, require "wb.lsp.on-attach")
    else
        config.on_attach = require "wb.lsp.on-attach"
    end
    config.capabilities = create_capabilities()
end)

local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

mason_lsp.setup({
    ensure_installed = {},
    automatic_installation = false,
})

local server_settings = {
    tsserver = {
        format = { enable = false },
    },
    eslint = {
        enable = true,
        format = { enable = true }, -- this will enable formatting
        packageManager = "npm",
        autoFixOnSave = true,
        codeActionsOnSave = {
            mode = "all",
            rules = { "!debugger", "!no-only-tests/*" },
        },
        lintTask = {
            enable = true,
        },
    }
}

mason_lsp.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {}
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "awesome", "screen", "mouse", "client", "root", "P", "vim" },
                    },
                },
            },
        })
    end,
    ["eslint"] = function()
        lspconfig.eslint.setup({
            settings = server_settings.eslint,
        })
    end
}
