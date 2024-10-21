return {
  'lewis6991/gitsigns.nvim',

  lazy = false,

  config = function()
    local signs = require 'gitsigns'

    signs.setup {
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align',
        delay = 100,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },

      signs = {
        add = { text = '+' },
        -- change = { text = '│' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        -- untracked = { text = '█' },
        -- untracked = { text = '¿' },
        untracked = { text = '│' },
      },

      on_attach = function(bufnr)
        local prevHunk = function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            signs.nav_hunk 'prev'
          end
        end

        local nextHunk = function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            signs.nav_hunk 'next'
          end
        end

        ---@format disable
        local mappings = {
          [{ 'n', 'x' }] = {
            -- Navigation
            { '[c', prevHunk, 'Previous hunk' },
            { ']c', nextHunk, 'Next hunk' },

            -- Actions
            { '<M-g>s', signs.stage_hunk, 'Stage hunk' },
            { '<M-g>r', signs.reset_hunk, 'Reset hunk' },
            { '<M-g>S', signs.stage_buffer, 'Stage buffer' },
            { '<M-g>u', signs.undo_stage_hunk, 'Undo stage buffer' },
            { '<M-g>R', signs.reset_buffer, 'Reset buffer' },
            { '<M-g>p', signs.preview_hunk, 'Preview hunk' },
            {
              '<M-g>bb',
              function()
                signs.blame_line { full = true }
              end,
              'Blame line',
            },
            { '<M-g>bt', signs.toggle_current_line_blame, 'Toggle blame line' },
            { '<M-g>dt', signs.toggle_deleted, 'Toggle deleted' },
            {
              '<M-g>dd',
              function()
                signs.diffthis '~'
              end,
              'Diff this',
            },
          },

          ['v'] = {
            {
              '<M-g>s',
              function()
                signs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
              end,
              'Stage hunk',
            },
            {
              '<M-g>r',
              function()
                signs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
              end,
              'Reset hunk',
            },
          },

          [{ 'o', 'x' }] = {
            { 'ig', ':<C-U>Gitsigns select_hunk<CR>', 'Hunk' },
          },
        }
        ---@format enable

        for mode, mappings in pairs(mappings) do
          for _, mapping in pairs(mappings) do
            local lhs, rhs, desc = unpack(mapping)

            vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = bufnr })
          end
        end
      end,
    }
  end,
}
