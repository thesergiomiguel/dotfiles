-- [nfnl] lua/plugins/quickfix.fnl
local function build_fzf()
  return vim.fn["fzf#install"]()
end
return {{"yorickpeterse/nvim-pqf"}, {"kevinhwang91/nvim-bqf", dependencies = {"junegunn/fzf", build = build_fzf}}}
