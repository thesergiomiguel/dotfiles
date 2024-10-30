local group = function(name)
  vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = { '*cargo run*' },
  group = group 'RustLspAutoCommands',

  callback = function()
    -- Move rustacean's run log to a split on the right;
    vim.cmd.wincmd 'L'

    -- Close the run log with `q`
    vim.keymap.set('n', 'q', '<cmd>bdelete!<cr>', { buffer = true, desc = 'Close' })
  end,
})

-- Also close help, qf, others with `q`
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'qf' },
  group = group 'QuitWithQ',

  callback = function()
    vim.keymap.set('n', 'q', '<cmd>bdelete!<cr>', { buffer = true, desc = 'Close' })
  end,
})

-- 'Fix' border/bg color 'issue' in floating windows and popups
-- (i.e. make it prettier.)
-- Needs to be done after setting the colorsche
vim.api.nvim_create_autocmd('ColorScheme', {
  group = group 'ColorFix',

  callback = function()
    vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
  end,
})
