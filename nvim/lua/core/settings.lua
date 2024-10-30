-- Disable NETRW right off the gate
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = [[\]]
vim.g.maplocalleader = ' '

-- Options
local opts = {
  -- general
  hidden = true,
  number = true,
  relativenumber = true,
  wrap = false,
  termguicolors = true,
  undofile = true,
  scrolloff = 7,
  sidescrolloff = 15,
  confirm = false,
  foldcolumn = 'auto',

  -- indentation,
  autoindent = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,

  -- searching,
  ignorecase = true,
  smartcase = true,
}

for option, value in pairs(opts) do
  vim.opt[option] = value
end
