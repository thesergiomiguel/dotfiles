-- [nfnl] lua/plugins/yanky.fnl
local function setup_yanky()
  local yanky = require("yanky")
  local function _1_()
    local root_3_auto = require("telescope")
    local parts_4_auto = {"load_extension"}
    local leaf_5_auto = root_3_auto
    for __6_auto, part_7_auto in ipairs(parts_4_auto) do
      leaf_5_auto = leaf_5_auto[part_7_auto]
    end
    return leaf_5_auto("yank_history")
  end
  yanky.setup({highlight = {on_put = true, on_yank = true, timer = 200}}, _1_())
  vim.keymap.set({"n"}, "y", "<Plug>(YankyYank)", {desc = "Put after cursor"})
  vim.keymap.set({"n"}, "p", "<Plug>(YankyPutAfter)", {desc = "Put after cursor"})
  vim.keymap.set({"n"}, "P", "<Plug>(YankyPutBefore)", {desc = "Put before cursor"})
  vim.keymap.set({"n"}, "gp", "<Plug>(YankyGPutAfter)", {desc = "Put after cursor"})
  vim.keymap.set({"n"}, "gP", "<Plug>(YankyGPutBefore)", {desc = "Put before cursor"})
  vim.keymap.set({"n"}, "<M-j>", "<Plug>(YankyPreviousEntry)", {desc = "Previous yank"})
  vim.keymap.set({"n"}, "<M-k>", "<Plug>(YankyNextEntry)", {desc = "Next yank"})
  vim.keymap.set({"n"}, "gy", "<cmd>Telescope yank_history<cr>", {desc = "Historical yanks"})
  return vim.keymap.set({"i"}, "<M-y>", "<cmd>Telescope yank_history<cr>", {desc = "Historical yanks"})
end
return {"gbprod/yanky.nvim", config = setup_yanky, lazy = false}
