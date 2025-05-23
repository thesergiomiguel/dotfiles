(import-macros {: use!} :macros.vim)

(fn build-fzf []
  ; vim.fn['fzf#install']()
  ((. vim.fn "fzf#install")))

[(use! :yorickpeterse/nvim-pqf)
 (use! :kevinhwang91/nvim-bqf
       {:dependencies
        (use! :junegunn/fzf
              {:build build-fzf})})]
 
