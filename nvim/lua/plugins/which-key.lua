-- [nfnl] lua/plugins/which-key.fnl
local function toggle_clipboard()
  local next
  if (vim.o.clipboard == "") then
    next = "unnamedplus"
  else
    next = ""
  end
  vim.o["clipboard"] = next
  return print(("cb=" .. next))
end
local function toggle_background()
  local next
  if (vim.o.background == "dark") then
    next = "light"
  else
    next = "dark"
  end
  vim.o["background"] = next
  return nil
end
local function toggle_number()
  vim.o["number"] = not vim.o.number
  if vim.o.number then
    vim.o["relativenumber"] = true
    return nil
  else
    vim.o["relativenumber"] = false
    return nil
  end
end
local keymaps
local _4_
do
  local base_2_auto = {("<C-\\>" .. "c"), toggle_clipboard, desc = ("Toggle " .. "clipboard")}
  if {} then
    for i_3_auto = 1, #{}, 2 do
      base_2_auto[({})[i_3_auto]] = ({})[(i_3_auto + 1)]
    end
  else
  end
  _4_ = base_2_auto
end
local _6_
do
  local base_2_auto = {("<C-\\>" .. "n"), toggle_number, desc = ("Toggle " .. "number")}
  if {} then
    for i_3_auto = 1, #{}, 2 do
      base_2_auto[({})[i_3_auto]] = ({})[(i_3_auto + 1)]
    end
  else
  end
  _6_ = base_2_auto
end
local function _8_(...)
  local base_2_auto = {("<C-\\>" .. "b"), toggle_background, desc = ("Toggle " .. "background")}
  if {} then
    for i_3_auto = 1, #{}, 2 do
      base_2_auto[({})[i_3_auto]] = ({})[(i_3_auto + 1)]
    end
  else
  end
  return base_2_auto
end
keymaps = {_4_, _6_, _8_(...)}
local opts
local function _10_()
  local wk = require("which-key")
  return wk.show({keys = "<C-w>", loop = true, desc = "C-w"})
end
opts = {spec = {"<M-w>", _10_, mode = "n"}}
local function _11_()
  local wk = require("which-key")
  wk.setup(opts)
  return wk.add(keymaps)
end
return {"folke/which-key.nvim", config = _11_}
