return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'

    -- Borders on floating windows
    local border = {
      { '┌', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '┐', 'FloatBorder' },
      { '│', 'FloatBorder' },
      { '┘', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '└', 'FloatBorder' },
      { '│', 'FloatBorder' },
    }
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Setup mappings
    local augroup = vim.api.nvim_create_augroup('UserLspConfig', {})
    vim.api.nvim_create_autocmd('LspAttach', {
      group = augroup,
      callback = function(ev)
        -- see: https://aliquote.org/post/neovim-lsp-easy/

        local mappings = {
          { 'gla', vim.lsp.buf.code_action,     'Code actions' },
          { 'gln', vim.lsp.buf.rename,          'Rename' },
          { 'glr', vim.lsp.buf.references,      'Code actions' },
          { 'gld', vim.lsp.buf.definition,      'Definition' },
          { 'glD', vim.lsp.buf.declaration,     'Declaration' },
          { 'glk', vim.lsp.buf.signature_help,  'Signature help' },
          { 'glt', vim.lsp.buf.type_definition, 'Type def.' },
          { 'gli', vim.lsp.buf.implementation,  'Implementation' },
          { 'gl=', vim.lsp.buf.format,          'Format (lsp)' },

          {
            '<M-l>h',
            function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end,
            'Toggle inlay hints',
          },
        }

        for _, mapping in pairs(mappings) do
          local lhs, rhs, desc = unpack(mapping)
          local opts = { buffer = ev.bufnr, desc = desc }

          vim.keymap.set({ 'n', 'v' }, lhs, rhs, opts)
        end
      end,
    })

    -- Setup diagnostics
    vim.diagnostic.config {
      float = {
        -- UI.
        border = 'rounded',
        focusable = true,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '⚈',
          [vim.diagnostic.severity.WARN] = '⚈',
          [vim.diagnostic.severity.HINT] = '⚈',
          [vim.diagnostic.severity.INFO] = '⚈',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
          [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
          [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
        },
      },
    }

    -- Setup clients
    lspconfig.cssls.setup {}
    lspconfig.eslint.setup {}
    lspconfig.tailwindcss.setup {}
    lspconfig.jsonls.setup {}

    -- vtsls
    require('lspconfig.configs').vtsls = require('vtsls').lspconfig
    lspconfig.vtsls.setup {
      settings = {
        typescript = {
          inlayHints = {
            parameterNames = { enabled = 'literals' },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
        },
      },
    }

    lspconfig.lua_ls.setup {
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
          },

          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              '${3rd}/luv/library',
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
    }
  end,
}
