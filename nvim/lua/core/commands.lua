-- Diff unsaved changes
vim.api.nvim_create_user_command('DiffOrig', function()
  -- Get start buffer and associated filetype
  local original = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = original })

  -- Also get window id so we can re-enable Barbecue later on
  local original_win_num = vim.api.nvim_get_current_win()

  -- Create new scratch buffer and load current file
  vim.cmd 'vertical new'
  vim.bo.buftype = 'nofile'
  vim.cmd 'read ++edit #'
  vim.cmd 'normal ggdd'

  -- Start diffing
  vim.cmd.diffthis()

  -- Get scratch buffer and set filetype to be the same as original
  local scratch = vim.api.nvim_get_current_buf()
  vim.api.nvim_set_option_value('filetype', filetype, { buf = scratch })

  -- Move to original buffer and set diff mode
  vim.cmd.wincmd 'p'
  vim.cmd.diffthis()

  -- Disable Barbecue in original window
  vim.cmd 'Barbecue hide'

  -- Map `q` for both buffers to exit diff view and delete scratch buffer
  for _, buf in ipairs { scratch, original } do
    vim.keymap.set('n', 'q', function()
      vim.cmd 'windo diffoff'
      vim.api.nvim_buf_delete(scratch, { force = true })
      vim.keymap.del('n', 'q', { buffer = original })

      -- Re-enable Barbecue in original window
      vim.api.nvim_win_call(original_win_num, function()
        vim.cmd 'Barbecue show'
      end)
    end, { buffer = buf })
  end
end, {})
