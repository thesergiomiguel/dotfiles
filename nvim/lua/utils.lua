-- [nfnl] fnl/utils.fnl
local function seq_3f(t)
  local _1_
  do
    local result = false
    for k, _ in pairs(t) do
      result = (result or (type(k) ~= "number"))
    end
    _1_ = result
  end
  return not _1_
end
local function string_split(str, sep)
  local tbl_21_ = {}
  local i_22_ = 0
  for part in string.gmatch(str, ("([^" .. sep .. "]+)")) do
    local val_23_ = part
    if (nil ~= val_23_) then
      i_22_ = (i_22_ + 1)
      tbl_21_[i_22_] = val_23_
    else
    end
  end
  return tbl_21_
end
local function filter(t, f)
  local tbl_21_ = {}
  local i_22_ = 0
  for _, v_23 in ipairs(t) do
    local val_23_
    if f(v_23) then
      val_23_ = v_23
    else
      val_23_ = nil
    end
    if (nil ~= val_23_) then
      i_22_ = (i_22_ + 1)
      tbl_21_[i_22_] = val_23_
    else
    end
  end
  return tbl_21_
end
local function contains_3f(t, v)
  if seq_3f(t) then
    local found = false
    for _, curr in ipairs(t) do
      if found then break end
      if (v == curr) then
        found = true
      else
      end
    end
    return found
  else
    return (nil ~= t[v])
  end
end
return {["seq?"] = seq_3f, ["string-split"] = string_split, filter = filter, ["contains?"] = contains_3f}
