(import-macros {: use! : map!} :macros.vim)

(fn setup-leap []
  (map! :nxo :<localleader>s "<Plug>(leap)" {:desc "Leap"})
  (map! :nxo :<C-w><localleader>s "<Plug>(leap-anywhere)" {:desc "Leap from window"}))

(use! :ggandor/leap.nvim
      {:config setup-leap})
