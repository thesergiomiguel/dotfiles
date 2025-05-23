-- [nfnl] lsp/lua_ls.fnl
local function setup_vim_lua_api(client)
  local has_luarc_3f
  local and_1_ = client.workspace_folders
  if and_1_ then
    local path = client.workspace_folders[1].name
    and_1_ = ((path ~= vim.fn.stdpath("config")) and (vim.uv.fs_stat((path .. "/.luarc.json")) or vim.uv.fs_stat((path .. "/.luarc.jsonc"))))
  end
  has_luarc_3f = and_1_
  if not has_luarc_3f then
    client.config.settings["Lua"] = vim.tbl_deep_extend("force", (client.config.settings.Lua or {}), {runtime = {version = "LuaJIT", path = {"lua/?.lua", "lua/?/init.lua"}}, workspace = {library = {vim.env.VIMRUNTIME}, checkThirdParty = false}})
    return nil
  else
    return nil
  end
end
return {settings = {Lua = {}}, on_init = setup_vim_lua_api}
