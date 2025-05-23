-- [nfnl] lua/config/settings.fnl
vim.g["loaded_netrw"] = 1
vim.g["loaded_netrwPlugin"] = 1
vim.g["mapleader"] = " "
vim.g["maplocalleader"] = "\\"
local opts = {hidden = true, number = true, relativenumber = true, termguicolors = true, undofile = true, scrolloff = 7, sidescrolloff = 15, foldcolumn = "auto", autoindent = true, expandtab = true, tabstop = 2, softtabstop = 2, shiftwidth = 2, ignorecase = true, smartcase = true, confirm = false, wrap = false}
for opt, value in pairs(opts) do
  vim.o[opt] = value
end
return nil
