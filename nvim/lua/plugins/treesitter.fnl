(require-macros :macros.vim)

(local parsers
       [; vim
        :fennel
        :lua
        :vim
        :vimdoc

        ; web
        :css
        :scss
        :html
        :javascript
        :typescript
        :tsx
        :json

        ; git
        :gitcommit
        :gitignore

        ; other
        :markdown
        :markdown_inline
        :yaml
        :toml
        :bash])

(fn setup []
  (let [ts (require :nvim-treesitter.configs)
        highlight {:enable true :additional_vim_regex_highlighting false}
        indent {:enable true}
        incremental_selection {:enable true
                               :keymaps {:init_selection "<localleader>v"
                                         :node_incremental :v
                                         :node_decremental :V
                                         :scope_incremental "<localleader>v"}}
        opts {:ensure_installed parsers
              :highlight highlight
              :indent indent
              :incremental_selection incremental_selection}]
    (ts.setup opts)))

(use! :nvim-treesitter/nvim-treesitter
      {:build (lambda []
               (let [ts (require :nvim-treesitter.install)]
                 (ts.update {:with_sync true})))
       :config setup})
