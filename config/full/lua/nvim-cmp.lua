local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
        { name = 'snippy' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }),
})
