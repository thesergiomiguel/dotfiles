-- [nfnl] lua/plugins/conjure.fnl
local function _1_()
  vim.g["conjure#filetypes"] = {"fennel", "scheme", "racket"}
  return nil
end
return {"Olical/conjure", init = _1_}
