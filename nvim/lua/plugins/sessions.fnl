(import-macros {: map! : use!} :macros.vim)

(fn setup []
  (let [persistence (require :persistence)
        opts {:need 1
              :branch true}]
    (do
      (persistence.setup opts)
      (map! :n "<M-\\>S" persistence.select {:desc "Select session"})
      (map! :n "<M-\\>l" persistence.load {:desc "Load session"}))))

(use! :folke/persistence.nvim {:config setup})
