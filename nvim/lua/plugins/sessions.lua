-- [nfnl] lua/plugins/sessions.fnl
local function setup()
  local persistence = require("persistence")
  local opts = {need = 1, branch = true}
  persistence.setup(opts)
  vim.keymap.set({"n"}, "<M-\\>S", persistence.select, {desc = "Select session"})
  return vim.keymap.set({"n"}, "<M-\\>l", persistence.load, {desc = "Load session"})
end
return {"folke/persistence.nvim", config = setup}
