-- [nfnl] lua/config/diagnostics.fnl
local function diag_prefix(suffix)
  local prefix = "<localleader>d"
  return (prefix .. (suffix or ""))
end
local function toggle_diagnostics()
  return vim.diagnostic.enable(not vim.diagnostic.is_enabled({bufnr = 0}))
end
vim.keymap.set({"n", "x"}, diag_prefix("d"), toggle_diagnostics, {desc = "Toggle buffer diagnostics"})
local function toggle_virtual_lines()
  return vim.diagnostic.config({virtual_lines = not vim.diagnostic.config().virtual_lines})
end
vim.keymap.set({"n", "x"}, diag_prefix("l"), toggle_virtual_lines, {desc = "Toggle virtual lines"})
local function toggle_virtual_text()
  return vim.diagnostic.config({virtual_text = not vim.diagnostic.config().virtual_text})
end
vim.keymap.set({"n", "x"}, diag_prefix("t"), toggle_virtual_text, {desc = "Toggle virtual text"})
local function _1_()
  return vim.diagnostic.jump({count = -1})
end
vim.keymap.set({"n", "x"}, diag_prefix("["), _1_, {desc = "Previous"})
local function _2_()
  return vim.diagnostic.jump({count = 1})
end
vim.keymap.set({"n", "x"}, diag_prefix("]"), _2_, {})
local function _3_()
  return vim.diagnostic.setqflist()
end
vim.keymap.set({"n", "x"}, diag_prefix("q"), _3_, {desc = "Set qf list"})
local _local_4_ = require("nfnl.core")
local boolean_3f = _local_4_["boolean?"]
local function shift_virtual_text_pos()
  local vt = vim.diagnostic.config().virtual_text
  local pos
  if boolean_3f(vt) then
    pos = nil
  else
    pos = vt.virt_text_pos
  end
  local next
  if (pos == "eol") then
    next = "right_align"
  elseif (pos == "right_align") then
    next = "eol"
  else
    local _ = pos
    next = "right_align"
  end
  return vim.diagnostic.config({virtual_text = {virt_text_pos = next}})
end
return vim.keymap.set({"n", "x"}, diag_prefix("<Space>"), shift_virtual_text_pos, {desc = "Move virtual text"})
