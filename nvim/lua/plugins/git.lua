-- [nfnl] lua/plugins/git.fnl
local function setup_gitsigns_buf_keymaps(bufnr)
  local function _1_()
    do
      local root_3_auto = require("gitsigns")
      local parts_4_auto = {"nav_hunk"}
      local leaf_5_auto = root_3_auto
      for __6_auto, part_7_auto in ipairs(parts_4_auto) do
        leaf_5_auto = leaf_5_auto[part_7_auto]
      end
      leaf_5_auto("prev")
    end
    return {desc = "Previous hunk", buffer = bufnr}
  end
  vim.keymap.set({"n", "x"}, "[c", _1_, {})
  local function _2_()
    do
      local root_3_auto = require("gitsigns")
      local parts_4_auto = {"nav_hunk"}
      local leaf_5_auto = root_3_auto
      for __6_auto, part_7_auto in ipairs(parts_4_auto) do
        leaf_5_auto = leaf_5_auto[part_7_auto]
      end
      leaf_5_auto("next")
    end
    return {desc = "Next hunk", buffer = bufnr}
  end
  vim.keymap.set({"n", "x"}, "]c", _2_, {})
  local function _3_()
    local root_3_auto = require("gitsigns")
    local parts_4_auto = {"reset_hunk"}
    local leaf_5_auto = root_3_auto
    for __6_auto, part_7_auto in ipairs(parts_4_auto) do
      leaf_5_auto = leaf_5_auto[part_7_auto]
    end
    return leaf_5_auto()
  end
  vim.keymap.set({"n", "x"}, "<localleader>gr", _3_, {desc = "Reset hunk", buffer = bufnr})
  local function _4_()
    local root_3_auto = require("gitsigns")
    local parts_4_auto = {"reset_buffer"}
    local leaf_5_auto = root_3_auto
    for __6_auto, part_7_auto in ipairs(parts_4_auto) do
      leaf_5_auto = leaf_5_auto[part_7_auto]
    end
    return leaf_5_auto()
  end
  vim.keymap.set({"n", "x"}, "<localleader>gR", _4_, {desc = "Reset buffer", buffer = bufnr})
  local function _5_()
    local root_3_auto = require("gitsigns")
    local parts_4_auto = {"blame_line"}
    local leaf_5_auto = root_3_auto
    for __6_auto, part_7_auto in ipairs(parts_4_auto) do
      leaf_5_auto = leaf_5_auto[part_7_auto]
    end
    return leaf_5_auto({full = true})
  end
  return vim.keymap.set({"n", "x"}, "<localleader>gp", _5_, {desc = "Preview hunk", buffer = bufnr})
end
local function setup_gitsigns()
  local signs = require("gitsigns")
  return signs.setup({on_attach = setup_gitsigns_buf_keymaps})
end
local function setup_neogit()
  return vim.keymap.set({"n", "x"}, "<C-Space>g", "<cmd>Neogit<cr>", {desc = "Neogit"})
end
return {{"lewis6991/gitsigns.nvim", config = setup_gitsigns}, {"NeogitOrg/neogit", dependencies = {{"nvim-lua/plenary.nvim"}}, config = setup_neogit}}
