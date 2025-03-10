return {
  'oskarrrrrrr/symbols.nvim',
  config = function()
    local r = require 'symbols.recipes'

    require('symbols').setup(r.DefaultFilters, r.AsciiSymbols, {
      sidebar = {
        hide_cursor = false,
        show_inline_details = true,
        auto_peek = true,
        auto_resize = {
          enabled = true,
        },
      },
    })

    vim.keymap.set('n', '<localleader>s', '<cmd>SymbolsToggle<cr>')
  end,
}
