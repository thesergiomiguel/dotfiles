return {
  'trevorhauter/gitportal.nvim',
  config = function()
    local gitportal = require 'gitportal'

    gitportal.setup {
      switch_branch_or_commit_upon_ingestion = 'ask_first',
    }

    -- open_file_in_browser() in normal mode
    -- Opens the current file in your browser on the correct branch/commit.
    vim.keymap.set('n', '<leader>gh', function()
      gitportal.open_file_in_browser()
    end)

    -- open_file_in_browser() in visual mode
    -- This behaves the same but it also includes the selected line(s) in the permalink.
    vim.keymap.set('v', '<leader>gh', function()
      gitportal.open_file_in_browser()
    end)

    -- open_file_in_neovim()
    -- Requests a github link, optionally switches to the branch/commit, and
    -- opens the specified file in neovim. Line ranges, if included, are respected.
    vim.keymap.set('n', '<leader>gv', function()
      gitportal.open_file_in_neovim()
    end)
  end,
}
