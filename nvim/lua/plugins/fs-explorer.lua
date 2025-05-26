-- [nfnl] lua/plugins/fs-explorer.fnl
local function toggle_nvtree()
  local root_3_auto = require("nvim-tree.api")
  local parts_4_auto = {"tree", "toggle"}
  local leaf_5_auto = root_3_auto
  for __6_auto, part_7_auto in ipairs(parts_4_auto) do
    leaf_5_auto = leaf_5_auto[part_7_auto]
  end
  return leaf_5_auto({find_file = true})
end
local function setup_nvtree()
  local nvtree = require("nvim-tree")
  nvtree.setup()
  return vim.keymap.set({"n", "x"}, "<C-n>", toggle_nvtree, {desc = "File explorer"})
end
return {"nvim-tree/nvim-tree.lua", config = setup_nvtree}
