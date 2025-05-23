(import-macros {: use! : set!} :macros.vim)

(fn toggle-clipboard []
  (let [next (if
               (= vim.o.clipboard "")
               "unnamedplus"
               "")]
   (set! :clipboard next)
   (print
     (.. :cb= next))))

(fn toggle-background []
  (let [next (if
               (= vim.o.background :dark)
               :light
               :dark)]
    (set! :background next)))

(fn toggle-number []
  (set! :number (not vim.o.number))
  (if vim.o.number
      (set! :relativenumber true)
      (set! :relativenumber false)))

(macro toggle! [k name handler & rest]
  "Creates a which-key.Spec keymap bound to the toggle hotkey."
  `(let [base# {1 (.. :<C-\> ,k)
                2 ,handler
                :desc (.. "Toggle " ,name)}]
     (when ,rest
       (for [i# 1 (length ,rest) 2]
         (tset base# (. ,rest i#) (. ,rest (+ i# 1)))))
     base#))

(local keymaps
       [(toggle! :c :clipboard toggle-clipboard)
        (toggle! :n :number toggle-number)
        (toggle! :b :background toggle-background)])

(let [opts
       {:spec
        {1 "<M-w>"
         2 (lambda []
             (let [wk (require :which-key)]
               (wk.show {:keys "<C-w>" :loop true :desc "C-w"})))
         :mode :n}}]
  (use! :folke/which-key.nvim
        {:config
         (lambda []
           (let [wk (require :which-key)]
             (wk.setup opts)
             (wk.add keymaps)))})) 
