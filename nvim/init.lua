-- Bootstrap
local function bootstrap()
  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)
end

bootstrap()

require 'core.settings'
require 'core.mappings'
require 'core.packages'
require 'core.autocmds'

vim.cmd.colorscheme 'github_dark'
