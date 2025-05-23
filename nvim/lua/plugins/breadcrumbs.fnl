(import-macros {: use!} :macros.vim)

(fn setup-dropbar []
  (let [dropbar (require :dropbar)]
    (dropbar.setup)))

(use! :Bekaboo/dropbar.nvim
      {:dependencies [(use! :nvim-telescope/telescope-fzf-native.nvim
                           {:build :make})]
       :config setup-dropbar})
