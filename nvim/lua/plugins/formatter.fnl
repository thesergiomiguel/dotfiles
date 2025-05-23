(import-macros {: use! : map! : call-nested : setlocal!} :macros.vim)

(fn format-buf []
  (call-nested :conform :format))

(fn toggle-buf-autoformat []
  (setlocal! :disable_autoformat (not vim.b.disable_autoformat))
  (print
    (if vim.b.disable_autoformat
        "Autoformat disabled for this buffer"
        "Autoformat enabled for this buffer")))

(fn setup-conform []
  (let [conform (require :conform)
        web-formatters [:eslint :prettier]]
    (conform.setup {:formatters_by_ft
                     {:javascript web-formatters
                      :typescript web-formatters
                      :javascriptreact web-formatters
                      :typescriptreact web-formatters
                      :css [:prettier]
                      :scss [:prettier]}
                    :format_on_save
                     {:timeout_ms 500
                      :lsp_format :fallback}})
    (map! :nv :<localleader>f format-buf {:desc "Format buffer"})
    (map! :nx :<M-t>f toggle-buf-autoformat {:desc "Toggle buffer autoformat"})))

(use! :stevearc/conform.nvim
      {:config setup-conform})
