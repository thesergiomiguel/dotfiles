-- [nfnl] lua/plugins/fs-explorer.fnl
local function toggle_nvtree()
  local root_10_auto = require("nvim-tree.api")
  local parts_11_auto
  do
    local tbl_21_ = {}
    local i_22_ = 0
    for part_9_auto in string.gmatch("tree.toggle", ("([^" .. "." .. "]+)")) do
      local val_23_ = part_9_auto
      if (nil ~= val_23_) then
        i_22_ = (i_22_ + 1)
        tbl_21_[i_22_] = val_23_
      else
      end
    end
    parts_11_auto = tbl_21_
  end
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
