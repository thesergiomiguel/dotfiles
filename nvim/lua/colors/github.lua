return {
  'projekt0n/github-nvim-theme',
  lazy = false,
  priority = 1000,
  config = function()
    require('github-theme').setup {
      options = {
        styles = {
          comments = 'italic',
          -- functions = 'italic',
        },

        darken = {
          sidebars = {
            enable = true,
            list = { 'NvimTree' },
          },
        },
      },

      groups = {
        all = {
          FlashLabel = { fg = 'fg1', bg = 'sel1' },
        },

        github_dark = {
          WhichKeyNormal = { link = 'Normal' },
        },
      },
    }
  end,
}
