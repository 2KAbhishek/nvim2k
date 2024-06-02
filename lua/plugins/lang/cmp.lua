local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip/loaders/from_vscode').lazy_load()

local icons = require('lib.icons')
local kind_icons = icons.kind
vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,preview,noselect',
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.config.disable,
        ['<C-c>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        expandable_indicator = true,
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = kind_icons[vim_item.kind]

            if entry.source.name == 'copilot' then
                vim_item.kind = icons.git.Octoface
                vim_item.kind_hl_group = 'CmpItemKindCopilot'
            end

            vim_item.menu = ({
                copilot = '[Copilot]',
                nvim_lsp = '[LSP]',
                luasnip = '[Snippet]',
                buffer = '[Buffer]',
                path = '[Path]',
            })[entry.source.name]
            return vim_item
        end,
    },

    sources = {
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer', keyword_length = 3 },
        { name = 'lazydev', group_index = 0 },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = {
            border = 'rounded',
            winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
        },
        completion = {
            border = 'rounded',
            winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
        },
        scrollbar = true,
    },
    experimental = {
        ghost_text = true,
    },
})
