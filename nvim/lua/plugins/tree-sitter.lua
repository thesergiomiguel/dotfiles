return {
  'nvim-treesitter/nvim-treesitter',

  build = function()
    require('nvim-treesitter.install').update { with_sync = true }()
  end,

  config = function()
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      sync_install = false,
      auto_install = false,
      ignore_install = {},
      ensure_installed = {
        -- webdev
        'css',
        'scss',
        'html',
        'javascript',
        'typescript',
        'tsx',
        'json',

        -- rust
        'rust',

        -- vim/neovim
        'lua',
        'vim',
        'vimdoc',

        -- git
        'gitcommit',
        'gitignore',

        -- misc
        'markdown',
        'markdown_inline',
        'yaml',
        'toml',
        'bash',
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<localleader>v',
          node_incremental = 'v',
          node_decremental = 'V',
          scope_incremental = '<localleader>V',
        },
      },

      -- Lazydev complains about missing property `modules`
      modules = {},
    }
  end,
}
