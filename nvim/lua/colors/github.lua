return {
  'projekt0n/github-nvim-theme',
  lazy = false,
  priority = 1000,
  config = function()
    local base = '#2f353a'

    local c = {
      bg = {
        border = base,
        title = '#aa5b55',
        normal = base,
        counter = 'fg1',
        cursor_line = '#40474e',
        bqf_thumb = '#aa5b55',
      },

      fg = {
        border = base,
        title = 'fg1',
        normal = 'fg1',
      },
    }

    require('github-theme').setup {
      options = {
        transparent = true,

        styles = {
          comments = 'italic',
          functions = 'italic',
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

          TelescopePromptBorder = { bg = c.bg.border, fg = c.fg.border },
          TelescopePromptTitle = { bg = c.bg.title, fg = c.fg.title },
          TelescopePromptNormal = { bg = c.bg.normal, fg = c.fg.normal },
          TelescopePromptCounter = { fg = c.bg.counter },
          TelescopeResultsBorder = { bg = c.bg.border, fg = c.fg.border },
          TelescopeResultsTitle = { bg = c.bg.title, fg = c.fg.title },
          TelescopeResultsNormal = { bg = c.bg.normal },
          TelescopePreviewBorder = { bg = c.bg.border, fg = c.fg.border },
          TelescopePreviewTitle = { bg = c.bg.title, fg = c.fg.title },
          TelescopePreviewNormal = { bg = c.bg.normal },

          CursorLine = { bg = c.bg.cursor_line },

          BqfPreviewFloat = { bg = c.bg.normal },
          BqfPreviewBorder = { bg = c.bg.border, fg = c.fg.border },
          BqfPreviewThumb = { bg = c.bg.bqf_thumb },

          WhichKey = { bg = c.bg.border },
          WhichKeyNormal = { bg = c.bg.border },
          WhichKeyBorder = { bg = c.bg.border, fg = c.fg.border },
          WhichKeyTitle = { bg = c.bg.title, fg = c.fg.titl },
        },

        github_dark = {
          StatusLine = { link = '@string.regex' },
          StatusLineNC = { link = '@comment' },
        },
      },
    }
  end,
}
