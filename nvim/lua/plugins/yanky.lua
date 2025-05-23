-- [nfnl] lua/plugins/yanky.fnl
local function setup_yanky()
  local yanky = require("yanky")
  yanky.setup({highlight = {on_put = true, on_yank = true, timer = 200}})
  vim.keymap.set({"n"}, "y", "<Plug>(YankyYank)", {desc = "Put after cursor"})
  vim.keymap.set({"n"}, "p", "<Plug>(YankyPutAfter)", {desc = "Put after cursor"})
  vim.keymap.set({"n"}, "P", "<Plug>(YankyPutBefore)", {desc = "Put before cursor"})
  vim.keymap.set({"n"}, "gp", "<Plug>(YankyGPutAfter)", {desc = "Put after cursor"})
  vim.keymap.set({"n"}, "gP", "<Plug>(YankyGPutBefore)", {desc = "Put before cursor"})
  vim.keymap.set({"n"}, "<M-j>", "<Plug>(YankyPreviousEntry)", {desc = "Previous yank"})
  vim.keymap.set({"n"}, "<M-k>", "<Plug>(YankyNextEntry)", {desc = "Next yank"})
  return vim.keymap.set({"n"}, "<M-\\>Y", "<cmd>YankyRingHistory<cr>", {desc = "Historical yanks"})
end
return {"gbprod/yanky.nvim", config = setup_yanky, lazy = false}
