return {
  'sindrets/diffview.nvim',
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'DiffviewFileHistory',
        'DiffviewFileHistoryPanel',
        'DiffviewFiles',
      },
      group = vim.api.nvim_create_augroup('QCloseDiffview', { clear = true }),
      command = 'nnoremap <buffer><silent> q <cmd>DiffviewClose<cr>',
    })

    vim.keymap.set('n', '<M-g>dd', '<cmd>DiffviewOpen<cr>', { desc = 'Open diffview' })
    vim.keymap.set('n', '<M-g>df', '<cmd>DiffviewFileHistory %<cr>', { desc = 'Diff this file' })
    vim.keymap.set('x', '<M-g>df', "<cmd>'<,'>DiffviewFileHistory<cr>", { desc = 'Open diffview' })

    require('diffview').setup {}
  end,
}
