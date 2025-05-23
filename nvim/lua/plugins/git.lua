-- [nfnl] lua/plugins/git.fnl
local function setup_gitsigns_buf_keymaps(bufnr)
  local function _1_()
    do
      local root_10_auto = require("gitsigns")
      local parts_11_auto
      do
        local tbl_21_ = {}
        local i_22_ = 0
        for part_9_auto in string.gmatch("nav_hunk", ("([^" .. "." .. "]+)")) do
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
      leaf_12_auto("prev")
    end
    return {desc = "Previous hunk", buffer = bufnr}
  end
  vim.keymap.set({"n", "x"}, "[c", _1_, {})
  local function _3_()
    do
      local root_10_auto = require("gitsigns")
      local parts_11_auto
      do
        local tbl_21_ = {}
        local i_22_ = 0
        for part_9_auto in string.gmatch("nav_hunk", ("([^" .. "." .. "]+)")) do
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
      leaf_12_auto("next")
    end
    return {desc = "Next hunk", buffer = bufnr}
  end
  vim.keymap.set({"n", "x"}, "]c", _3_, {})
  local function _5_()
    local root_10_auto = require("gitsigns")
    local parts_11_auto
    do
      local tbl_21_ = {}
      local i_22_ = 0
      for part_9_auto in string.gmatch("reset_hunk", ("([^" .. "." .. "]+)")) do
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
  vim.keymap.set({"n", "x"}, "<localleader>gr", _5_, {desc = "Reset hunk", buffer = bufnr})
  local function _7_()
    local root_10_auto = require("gitsigns")
    local parts_11_auto
    do
      local tbl_21_ = {}
      local i_22_ = 0
      for part_9_auto in string.gmatch("reset_buffer", ("([^" .. "." .. "]+)")) do
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
  vim.keymap.set({"n", "x"}, "<localleader>gR", _7_, {desc = "Reset buffer", buffer = bufnr})
  local function _9_()
    local root_10_auto = require("gitsigns")
    local parts_11_auto
    do
      local tbl_21_ = {}
      local i_22_ = 0
      for part_9_auto in string.gmatch("blame_line", ("([^" .. "." .. "]+)")) do
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
    return leaf_12_auto({full = true})
  end
  return vim.keymap.set({"n", "x"}, "<localleader>gp", _9_, {desc = "Preview hunk", buffer = bufnr})
end
local function setup_gitsigns()
  local signs = require("gitsigns")
  return signs.setup({on_attach = setup_gitsigns_buf_keymaps})
end
local function setup_neogit()
  return vim.keymap.set({"n", "x"}, "<C-Space>g", "<cmd>Neogit<cr>", {desc = "Neogit"})
end
return {{"lewis6991/gitsigns.nvim", config = setup_gitsigns}, {"NeogitOrg/neogit", dependencies = {{"nvim-lua/plenary.nvim"}}, config = setup_neogit}}
