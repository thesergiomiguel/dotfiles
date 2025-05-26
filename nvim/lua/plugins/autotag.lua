-- [nfnl] lua/plugins/autotag.fnl
local function setup_autotag()
  local root_3_auto = require("nvim-ts-autotag")
  local parts_4_auto = {"setup"}
  local leaf_5_auto = root_3_auto
  for __6_auto, part_7_auto in ipairs(parts_4_auto) do
    leaf_5_auto = leaf_5_auto[part_7_auto]
  end
  return leaf_5_auto({})
end
return {"windwp/nvim-ts-autotag", config = setup_autotag}
