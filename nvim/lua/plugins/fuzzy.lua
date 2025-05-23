-- [nfnl] lua/plugins/fuzzy.fnl
local function setup_telescope()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")
  local actions = require("telescope.actions")
  local find_cmd = {"fd", "--type", "f", "--strip-cwd-prefix", "-H", "-E", ".git", "-E", "node_modules:"}
  local opts = {defaults = {dynamic_preview_title = true, mappings = {i = {["<Esc>"] = actions.close, ["<C-b>"] = actions.delete_buffer, ["<C-f>"] = actions.to_fuzzy_refine, ["<C-q>"] = (actions.smart_send_to_qflist + actions.open_qflist)}, n = {["<C-b>"] = actions.delete_buffer}}}, pickers = {colorscheme = {enable_preview = true, ignore_builtins = true}, find_files = {theme = "ivy", find_command = find_cmd}, live_grep = {theme = "ivy"}, grep_string = {theme = "ivy"}, buffers = {theme = "ivy"}}}
  telescope.setup(opts)
  do
    vim.keymap.set({"n"}, "<leader>p", builtin.find_files, {desc = "Find files"})
    vim.keymap.set({"n"}, "<leader>f", builtin.live_grep, {desc = "Live grep"})
    vim.keymap.set({"n"}, "<leader><M-f>", builtin.grep_string, {desc = "Find word under cursor"})
    vim.keymap.set({"n"}, "<leader>b", builtin.buffers, {desc = "List buffers"})
    vim.keymap.set({"n"}, "<M-\\>t", builtin.resume, {desc = "Resume telescope session"})
    vim.keymap.set({"n"}, "<C-Space>t", builtin.builtin, {desc = "Telescope"})
  end
  return telescope.load_extension("fzf")
end
local fzf_native = {"nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"}
return {"nvim-telescope/telescope.nvim", enabled = true, tag = "0.1.8", dependencies = {"nvim-lua/plenary.nvim", fzf_native}, config = setup_telescope}
