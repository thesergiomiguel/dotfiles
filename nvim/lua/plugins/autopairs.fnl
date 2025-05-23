(import-macros {: use! : call-nested} :macros.vim)

(fn disable-pair [c]
  (let [rule (. (call-nested :nvim-autopairs :get_rules c) 1)]
     (tset rule :not_filetypes [:lisp :scheme :racket :fennel])))

(fn setup-autopairs []
  (call-nested :nvim-autopairs :setup {})

  ;; disable quote and quasi-quote on lisps
  (disable-pair "'")
  (disable-pair "`"))

(use! :windwp/nvim-autopairs
      {;:event :InsertEnter
       :config setup-autopairs})
