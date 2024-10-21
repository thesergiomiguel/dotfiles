return {
  'stevearc/dressing.nvim',
  opts = {
    input = {
      get_config = function()
        -- disable for nvim-tree
        if vim.api.nvim_get_option_value('filetype', { scope = 'local' }) == 'NvimTree' then
          return { enabled = false }
        end
      end,
    },
  },
}
