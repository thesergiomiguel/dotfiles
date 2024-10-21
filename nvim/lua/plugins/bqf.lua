return {
  'kevinhwang91/nvim-bqf',
  dependencies = {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end,
  },
  opts = {
    func_map = {
      openc = '<cr>',
      open = '<M-cr>',
    },
  },
}
