-- [nfnl] lua/plugins/treesitter.fnl
local parsers = {"fennel", "lua", "vim", "vimdoc", "css", "scss", "html", "javascript", "typescript", "tsx", "json", "gitcommit", "gitignore", "markdown", "markdown_inline", "yaml", "toml", "bash"}
local function setup()
  local ts = require("nvim-treesitter.configs")
  local highlight = {enable = true, additional_vim_regex_highlighting = false}
  local indent = {enable = true}
  local incremental_selection = {enable = true, keymaps = {init_selection = "<localleader>v", node_incremental = "v", node_decremental = "V", scope_incremental = "<localleader>v"}}
  local opts = {ensure_installed = parsers, highlight = highlight, indent = indent, incremental_selection = incremental_selection}
  return ts.setup(opts)
end
local function _1_()
  local ts = require("nvim-treesitter.install")
  return ts.update({with_sync = true})
end
return {"nvim-treesitter/nvim-treesitter", build = _1_, config = setup}
