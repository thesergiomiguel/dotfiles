-- [nfnl] lua/plugins/autopairs.fnl
local function disable_pair(c)
  local rule
  local _1_
  do
    local root_10_auto = require("nvim-autopairs")
    local parts_11_auto = {"get_rules"}
    local leaf_12_auto = root_10_auto
    for __13_auto, part_14_auto in ipairs(parts_11_auto) do
      leaf_12_auto = leaf_12_auto[part_14_auto]
    end
    _1_ = leaf_12_auto(c)
  end
  rule = _1_[1]
  rule["not_filetypes"] = {"lisp", "scheme", "racket", "fennel"}
  return nil
end
local function setup_autopairs()
  do
    local root_10_auto = require("nvim-autopairs")
    local parts_11_auto = {"setup"}
    local leaf_12_auto = root_10_auto
    for __13_auto, part_14_auto in ipairs(parts_11_auto) do
      leaf_12_auto = leaf_12_auto[part_14_auto]
    end
    leaf_12_auto({})
  end
  disable_pair("'")
  return disable_pair("`")
end
return {"windwp/nvim-autopairs", config = setup_autopairs}
