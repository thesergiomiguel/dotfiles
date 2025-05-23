(import-macros {: use! : map! : call-nested : cmd} :macros.vim)

(fn setup-gitsigns-buf-keymaps [bufnr]
  (map! :nx "[c" (lambda [] (call-nested :gitsigns :nav_hunk :prev) {:desc "Previous hunk" :buffer bufnr}))
  (map! :nx "]c" (lambda [] (call-nested :gitsigns :nav_hunk :next) {:desc "Next hunk" :buffer bufnr}))
  (map! :nx :<localleader>gr  (lambda [] (call-nested :gitsigns :reset_hunk)) {:desc "Reset hunk" :buffer bufnr})
  (map! :nx :<localleader>gR (lambda [] (call-nested :gitsigns :reset_buffer)) {:desc "Reset buffer" :buffer bufnr})
  (map! :nx :<localleader>gp (lambda [] (call-nested :gitsigns :blame_line {:full true})) {:desc "Preview hunk" :buffer bufnr}))

(fn setup-gitsigns []
  (let [signs (require :gitsigns)]
    (signs.setup
      {:on_attach setup-gitsigns-buf-keymaps})))

(fn setup-neogit []
  (map! :nx :<C-Space>g (cmd :Neogit) {:desc :Neogit}))

[(use! :lewis6991/gitsigns.nvim
       {:config setup-gitsigns})

 (use! :NeogitOrg/neogit
       {:dependencies [(use! :nvim-lua/plenary.nvim)]
        :config setup-neogit})]
