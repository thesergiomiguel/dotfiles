-- [nfnl] lua/plugins/autopairs.fnl
local function disable_pair(c)
  local rule
  local _1_
  do
    local root_3_auto = require("nvim-autopairs")
    local parts_4_auto = {"get_rules"}
    local leaf_5_auto = root_3_auto
    for __6_auto, part_7_auto in ipairs(parts_4_auto) do
      leaf_5_auto = leaf_5_auto[part_7_auto]
    end
    _1_ = leaf_5_auto(c)
  end
  rule = _1_[1]
  rule["not_filetypes"] = {"lisp", "scheme", "racket", "fennel"}
  return nil
end
local function setup_autopairs()
  do
    local root_3_auto = require("nvim-autopairs")
    local parts_4_auto = {"setup"}
    local leaf_5_auto = root_3_auto
    for __6_auto, part_7_auto in ipairs(parts_4_auto) do
      leaf_5_auto = leaf_5_auto[part_7_auto]
    end
    leaf_5_auto({})
  end
  disable_pair("'")
  return disable_pair("`")
end
return {"windwp/nvim-autopairs", config = setup_autopairs}
