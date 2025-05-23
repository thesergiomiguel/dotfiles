-- [nfnl] lua/plugins/leap.fnl
local function setup_leap()
  vim.keymap.set({"n", "x", "o"}, "<localleader>s", "<Plug>(leap)", {desc = "Leap"})
  return vim.keymap.set({"n", "x", "o"}, "<C-w><localleader>s", "<Plug>(leap-anywhere)", {desc = "Leap from window"})
end
return {"ggandor/leap.nvim", config = setup_leap}
