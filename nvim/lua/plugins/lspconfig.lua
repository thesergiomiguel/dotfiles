-- [nfnl] lua/plugins/lspconfig.fnl
local function lsp_2fnew_tab_2fgoto_def()
  vim.cmd("tab split")
  return vim.lsp.buf.definition()
end
local function toggle_inlay_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  local function _1_()
    if vim.lsp.inlay_hint.is_enabled() then
      return "Inlay hints are enabled"
    else
      return "Inlay hints are disabled"
    end
  end
  return print(_1_())
end
local function setup_lsp()
  local servers = {"vtsls", "lua_ls", "fennel_language_server", "racket_langserver", "eslint"}
  vim.keymap.set({"n", "x"}, "<C-w><C-]>", lsp_2fnew_tab_2fgoto_def, {desc = "Go-to in new tab"})
  vim.keymap.set({"n", "x"}, "<C-\\>h", toggle_inlay_hints, {desc = "Toggle inlay hints"})
  for _, server in ipairs(servers) do
    vim.lsp.enable(server)
  end
  return nil
end
return {"neovim/nvim-lspconfig", config = setup_lsp}
