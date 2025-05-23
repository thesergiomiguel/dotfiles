(import-macros {: use! : map! : call-nested} :macros.vim)

(fn toggle-nvtree []
  "Toggle the file explorer"
  (call-nested :nvim-tree.api :tree.toggle {:find_file true}))

(fn setup-nvtree []
  (let [nvtree (require :nvim-tree)]
    (nvtree.setup)
    (map! :nx :<C-n> toggle-nvtree {:desc "File explorer"})))

(use! :nvim-tree/nvim-tree.lua
      {:config setup-nvtree})
