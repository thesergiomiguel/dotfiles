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
  local tbl_19_auto = {}
  local i_20_auto = 0
  for part in string.gmatch(str, ("([^" .. sep .. "]+)")) do
    local val_21_auto = part
    if (nil ~= val_21_auto) then
      i_20_auto = (i_20_auto + 1)
      tbl_19_auto[i_20_auto] = val_21_auto
    else
    end
  end
  return tbl_19_auto
end
local function filter(t, f)
  local tbl_19_auto = {}
  local i_20_auto = 0
  for _, v_23 in ipairs(t) do
    local val_21_auto
    if f(v_23) then
      val_21_auto = v_23
    else
      val_21_auto = nil
    end
    if (nil ~= val_21_auto) then
      i_20_auto = (i_20_auto + 1)
      tbl_19_auto[i_20_auto] = val_21_auto
    else
    end
  end
  return tbl_19_auto
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
