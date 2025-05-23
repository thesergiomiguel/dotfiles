local ok, lazy = pcall(require, "lazy")

if not ok then
  print "Lazy failed, skipping loading of plugins."
  return
end

lazy.setup {
  "folke/lazy.nvim",

  { import = "plugins" },
  { import = "colors" },
}

vim.keymap.set({ "n", "x" }, "<C-Space>l", "<cmd>Lazy check<cr>", { desc = "Lazy" })
