(import-macros {: use! : map! : cmd} :macros.vim)

(fn setup-yanky []
  (let [yanky (require :yanky)]
    (yanky.setup {:highlight
                  {:on_put true
                   :on_yank true
                   :timer 200}})

    (map! :n :y "<Plug>(YankyYank)" {:desc "Put after cursor"})
    (map! :n :p "<Plug>(YankyPutAfter)" {:desc "Put after cursor"})
    (map! :n :P "<Plug>(YankyPutBefore)" {:desc "Put before cursor"})
    (map! :n :gp "<Plug>(YankyGPutAfter)" {:desc "Put after cursor"})
    (map! :n :gP "<Plug>(YankyGPutBefore)" {:desc "Put before cursor"})
    (map! :n :<M-j> "<Plug>(YankyPreviousEntry)" {:desc "Previous yank"})
    (map! :n :<M-k> "<Plug>(YankyNextEntry)" {:desc "Next yank"})
    (map! :n :<M-\>Y (cmd :YankyRingHistory) {:desc "Historical yanks"})))

(use! :gbprod/yanky.nvim
      {:lazy false
       :config setup-yanky})
