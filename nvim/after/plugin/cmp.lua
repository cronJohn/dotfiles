local cmp = require("cmp")
local map = require("keytex.keybindings").create_keybinding

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-q>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'supermaven'},
  }, {
    { name = 'buffer' },
  }),
})

-- Make keybindings known to keytex
map("i", "<C-u>", cmp.mapping.scroll_docs, {desc = "Scroll up in docs"}, {mark = true})
map("i", "<C-d>", cmp.mapping.scroll_docs, {desc = "Scroll down in docs"}, {mark = true})
map("i", "<C-q>", cmp.mapping.abort, {desc = "Abort completion"}, {mark = true})
map("i", "<CR>", cmp.mapping.confirm, {desc = "Confirm completion"}, {mark = true})


 -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
 cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Icons
local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      symbol_map = { Supermaven = "" }
    })
  }
}
