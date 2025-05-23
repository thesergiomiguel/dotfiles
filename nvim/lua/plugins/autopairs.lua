-- [nfnl] lua/plugins/autopairs.fnl
local function disable_pair(c)
  local rule
  local _1_
  do
    local root_10_auto = require("nvim-autopairs")
    local parts_11_auto
    do
      local tbl_19_auto = {}
      local i_20_auto = 0
      for part_9_auto in string.gmatch("get_rules", ("([^" .. "." .. "]+)")) do
        local val_21_auto = part_9_auto
        if (nil ~= val_21_auto) then
          i_20_auto = (i_20_auto + 1)
          tbl_19_auto[i_20_auto] = val_21_auto
        else
        end
      end
      parts_11_auto = tbl_19_auto
    end
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
    local parts_11_auto
    do
      local tbl_19_auto = {}
      local i_20_auto = 0
      for part_9_auto in string.gmatch("setup", ("([^" .. "." .. "]+)")) do
        local val_21_auto = part_9_auto
        if (nil ~= val_21_auto) then
          i_20_auto = (i_20_auto + 1)
          tbl_19_auto[i_20_auto] = val_21_auto
        else
        end
      end
      parts_11_auto = tbl_19_auto
    end
    local leaf_12_auto = root_10_auto
    for __13_auto, part_14_auto in ipairs(parts_11_auto) do
      leaf_12_auto = leaf_12_auto[part_14_auto]
    end
    leaf_12_auto({})
  end
  disable_pair("'")
  return disable_pair("`")
end
return {"windwp/nvim-autopairs", event = "InsertEnter", config = setup_autopairs}
