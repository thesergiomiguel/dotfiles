-- [nfnl] lua/plugins/breadcrumbs.fnl
local function setup_dropbar()
  local dropbar = require("dropbar")
  return dropbar.setup()
end
return {"Bekaboo/dropbar.nvim", dependencies = {{"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, config = setup_dropbar}
