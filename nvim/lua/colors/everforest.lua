return {
  'neanias/everforest-nvim',
  lazy = false,
  priority = 1000,

  config = function()
    require('everforest').setup {
      italics = true,
    }
  end,
}
