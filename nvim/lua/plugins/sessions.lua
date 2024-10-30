return {
  'Shatur/neovim-session-manager',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require('session_manager').setup {

      autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
      autosave_ignore_filetypes = {
        'gitcommit',
        'gitrebase',
      },
    }

    vim.keymap.set('n', '<M-x>ss', function()
      vim.cmd.SessionManager 'load_current_dir_session'
    end, { desc = 'Load current dir session' })

    vim.keymap.set('n', '<M-x><M-s>', function()
      vim.cmd.SessionManager 'load_session'
    end, { desc = 'Load sessions' })
  end,
}
