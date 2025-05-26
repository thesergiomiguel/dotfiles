(import-macros {: use! : call-nested} :macros.vim)

(fn setup-autotag []
  (call-nested :nvim-ts-autotag :setup {}))

(use! :windwp/nvim-ts-autotag
      {:config setup-autotag})
