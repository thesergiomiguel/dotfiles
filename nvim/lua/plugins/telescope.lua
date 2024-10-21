return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    },
  },

  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'

    local mappings = {
      { '<C-p>', builtin.find_files, 'Find files' },
      { '<C-f>', builtin.live_grep, 'Live grep' },
      { '<CM-f>', builtin.grep_string, 'Grep string' },
      { '<C-b>', builtin.buffers, 'List buffers' },
      { '<C-t>', builtin.resume, 'Resume telescope session' },
      { '<M-x><M-t>', builtin.builtin, 'Telescope' },
    }

    for _, mapping in pairs(mappings) do
      local lhs, rhs, desc = unpack(mapping)

      vim.keymap.set({ 'n', 'x' }, lhs, rhs, { desc = desc })
    end

    -- setup
    telescope.setup {
      defaults = {
        dynamic_preview_title = true,

        mappings = {
          i = {
            ['<esc>'] = actions.close,
            ['<C-b>'] = actions.delete_buffer,
            ['<C-f>'] = actions.to_fuzzy_refine,
            ['<C-a>'] = actions.select_all,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
          },
          n = {
            ['<C-b>'] = actions.delete_buffer,
          },
        },
      },

      pickers = {
        find_files = {
          find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix', '-H', '-E', '.git', '-E', 'node_modules' },
          theme = 'ivy',
        },

        live_grep = {
          theme = 'ivy',
        },

        grep_string = {
          theme = 'ivy',
        },

        buffers = {
          theme = 'ivy',
        },

        colorscheme = {
          enable_preview = true,
          ignore_builtins = true,
        },
      },
    }

    -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    telescope.load_extension 'fzf'
  end,
}
