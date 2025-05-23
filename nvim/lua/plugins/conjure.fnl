(import-macros {: use! : let-g!} :macros.vim)
            
(use! :Olical/conjure
       {:init
        (lambda []
          (let-g! "conjure#filetypes" [:fennel
                                       :scheme
                                       :racket]))})
