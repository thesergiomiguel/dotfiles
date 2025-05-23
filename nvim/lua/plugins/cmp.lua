-- [nfnl] lua/plugins/cmp.fnl
local blink_version = "v1.2.0"
return {"saghen/blink.cmp", enabled = true, version = blink_version, dependencies = {{"L3MON4D3/LuaSnip", version = "v2.*"}}, opts = {snippets = {preset = "luasnip"}, completion = {ghost_text = {enabled = true}}, fuzzy = {implementation = "rust", prebuilt_binaries = {force_version = blink_version}}}}
