-- [nfnl] lua/plugins/fs-explorer.fnl
local function toggle_nvtree()
  local root_10_auto = require("nvim-tree.api")
  local parts_11_auto = {"tree", "toggle"}
  local leaf_12_auto = root_10_auto
  for __13_auto, part_14_auto in ipairs(parts_11_auto) do
    leaf_12_auto = leaf_12_auto[part_14_auto]
  end
  return leaf_12_auto({find_file = true})
end
local function setup_nvtree()
  local nvtree = require("nvim-tree")
  nvtree.setup()
  return vim.keymap.set({"n", "x"}, "<C-n>", toggle_nvtree, {desc = "File explorer"})
end
return {"nvim-tree/nvim-tree.lua", config = setup_nvtree}
