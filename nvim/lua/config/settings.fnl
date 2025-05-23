(import-macros {: let-g! : set!} :macros.vim)

;; Disable netrw
(let-g! :loaded_netrw 1)
(let-g! :loaded_netrwPlugin 1)

;; Keys
(let-g! :mapleader " ")
(let-g! :maplocalleader "\\")

(let [opts
       {; General
        :hidden true
        :number true
        :relativenumber true
        :wrap false
        :termguicolors true
        :undofile true
        :scrolloff 7
        :sidescrolloff 15
        :confirm false
        :foldcolumn :auto

        ; Indentation
        :autoindent true
        :expandtab true
        :tabstop 2
        :softtabstop 2
        :shiftwidth 2

        ; Searching
        :ignorecase true
        :smartcase true}]

  (each [opt value (pairs opts)]
    (set! opt value)))
