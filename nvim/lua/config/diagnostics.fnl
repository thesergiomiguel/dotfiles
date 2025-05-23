(import-macros {: map!} :macros.vim)

(fn diag-prefix [suffix]
  (let [prefix :<localleader>d]
  ; (let [prefix :<Esc><C-k>d<Esc><Esc>]
    (.. prefix (or suffix ""))))

(macro cfg [k enable?]
 `(vim.diagnostic.config {,k ,enable?}))

(macro cfg? [k]
  `(. (vim.diagnostic.config) ,k))

(fn toggle-diagnostics []
  (vim.diagnostic.enable
    (not (vim.diagnostic.is_enabled {:bufnr 0}))))

(map! :nx (diag-prefix :d) toggle-diagnostics {:desc "Toggle buffer diagnostics"})

(fn toggle-virtual-lines []
  (cfg :virtual_lines (not (cfg? :virtual_lines))))

(map! :nx (diag-prefix :l) toggle-virtual-lines {:desc "Toggle virtual lines"})

(fn toggle-virtual-text []
  (cfg :virtual_text (not (cfg? :virtual_text))))

(map! :nx (diag-prefix :t) toggle-virtual-text {:desc "Toggle virtual text"})

(map! :nx
      (diag-prefix "[")
      (lambda []
        (vim.diagnostic.jump {:count -1}))
      {:desc "Previous"})

(map! :nx
      (diag-prefix "]")
      (lambda []
        (vim.diagnostic.jump {:count 1})))

(map! :nx
      (diag-prefix "q")
      (lambda []
        (vim.diagnostic.setqflist))
      {:desc "Set qf list"})

; (map! :nx
;       :<localleader>d
;       (lambda []
;         ((. (require :which-key) :show) {:keys (diag-prefix) :loop true}))
;       {:desc "Diagnostics"})

(local {: boolean?} (require :nfnl.core))

(fn shift-virtual-text-pos []
  (let [vt (. (vim.diagnostic.config) :virtual_text)
        pos (if (boolean? vt)
                nil
                (. vt :virt_text_pos))]
    (let [next (match pos
                 "eol" "right_align"
                 "right_align" "eol"
                 _ "right_align")]
      (vim.diagnostic.config {:virtual_text {:virt_text_pos next}}))))

(map! :nx
      (diag-prefix :<Space>)
      shift-virtual-text-pos
      {:desc "Move virtual text"})
