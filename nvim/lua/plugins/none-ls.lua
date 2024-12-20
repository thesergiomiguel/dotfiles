return {
  'nvimtools/none-ls.nvim',

  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local nls = require 'null-ls'
    local builtins = nls.builtins
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    nls.setup {
      sources = {
        builtins.code_actions.gitsigns,
        builtins.formatting.stylua,
        builtins.formatting.prettier.with {
          extra_args = { '--single-quote' },
        },
      },

      on_attach = function(client, bufnr)
        vim.keymap.set({ 'n', 'x' }, 'g=', function()
          vim.lsp.buf.format { async = true, bufnr = bufnr }
        end, { buffer = bufnr, desc = 'Format buffer' })

        --- Format on save
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { async = false }
          end,
        })
      end,
    }
  end,
}
