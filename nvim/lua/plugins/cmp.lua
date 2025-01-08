return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    cmp.setup {
      -- Be explicit about this, since some plugins (cough rustacean) will for
      -- some reason try to select the first entry, and then do a bad job at it.
      preselect = cmp.PreselectMode.None,

      mapping = cmp.mapping.preset.insert {
        ['<c-b>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-space>'] = cmp.mapping.complete(),
        ['<c-e>'] = cmp.mapping.abort(),

        ['<cr>'] = cmp.mapping {
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true }
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm { select = true },
          c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
        },

        ['<Tab>'] = function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.jump(1)
          else
            fallback()
          end
        end,

        ['<S-Tab>'] = function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
      },

      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
      },

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'nvim_lsp_document_symbol' },
        }, {
          { name = 'buffer' },
        }),
        -- view = {
        --   entries = { name = 'wildmenu', separator = ' | ' },
        -- },
      }),

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'cmdline' },
        },
      }),
    }
  end,
}
