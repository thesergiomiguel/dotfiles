-- [nfnl] lua/plugins/formatter.fnl
local function format_buf()
  local root_10_auto = require("conform")
  local parts_11_auto
  do
    local tbl_21_ = {}
    local i_22_ = 0
    for part_9_auto in string.gmatch("format", ("([^" .. "." .. "]+)")) do
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
  return leaf_12_auto()
end
local function toggle_buf_autoformat()
  vim.b["disable_autoformat"] = not vim.b.disable_autoformat
  local function _2_()
    if vim.b.disable_autoformat then
      return "Autoformat disabled for this buffer"
    else
      return "Autoformat enabled for this buffer"
    end
  end
  return print(_2_())
end
local function setup_conform()
  local conform = require("conform")
  local web_formatters = {"eslint", "prettier"}
  conform.setup({formatters_by_ft = {javascript = web_formatters, typescript = web_formatters, javascriptreact = web_formatters, typescriptreact = web_formatters, css = {"prettier"}, scss = {"prettier"}}, format_on_save = {timeout_ms = 500, lsp_format = "fallback"}})
  vim.keymap.set({"n", "v"}, "<localleader>f", format_buf, {desc = "Format buffer"})
  return vim.keymap.set({"n", "x"}, "<M-t>f", toggle_buf_autoformat, {desc = "Toggle buffer autoformat"})
end
return {"stevearc/conform.nvim", config = setup_conform}
