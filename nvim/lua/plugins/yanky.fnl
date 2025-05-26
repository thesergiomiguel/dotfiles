(import-macros {: use! : map! : cmd : call-nested} :macros.vim)

; require("telescope").load_extension("yank_history")

(fn setup-yanky []
  (let [yanky (require :yanky)]
    (yanky.setup {:highlight
                  {:on_put true
                   :on_yank true
                   :timer 200}}
     (call-nested :telescope :load_extension :yank_history))

    (map! :n :y "<Plug>(YankyYank)" {:desc "Put after cursor"})
    (map! :n :p "<Plug>(YankyPutAfter)" {:desc "Put after cursor"})
    (map! :n :P "<Plug>(YankyPutBefore)" {:desc "Put before cursor"})
    (map! :n :gp "<Plug>(YankyGPutAfter)" {:desc "Put after cursor"})
    (map! :n :gP "<Plug>(YankyGPutBefore)" {:desc "Put before cursor"})
    (map! :n :<M-j> "<Plug>(YankyPreviousEntry)" {:desc "Previous yank"})
    (map! :n :<M-k> "<Plug>(YankyNextEntry)" {:desc "Next yank"})
    (map! :n :gy (cmd :Telescope :yank_history) {:desc "Historical yanks"})
    (map! :i :<M-y> (cmd :Telescope :yank_history) {:desc "Historical yanks"})))

(use! :gbprod/yanky.nvim
      {:lazy false
       :config setup-yanky})
