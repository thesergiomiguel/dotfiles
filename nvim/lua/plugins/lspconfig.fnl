(import-macros {: use! : map!} :macros.vim)

(fn lsp/new-tab/goto-def []
  (vim.cmd "tab split")
  (vim.lsp.buf.definition))

(fn toggle-inlay-hints []
  (vim.lsp.inlay_hint.enable (not (vim.lsp.inlay_hint.is_enabled)))
  (print
    (if (vim.lsp.inlay_hint.is_enabled)
        "Inlay hints are enabled"
        "Inlay hints are disabled")))

(fn setup-lsp []
  (let [servers [:vtsls
                 :lua_ls
                 :fennel_language_server
                 :racket_langserver
                 :eslint]]
    (do
      (map! :nx "<C-w><C-]>" lsp/new-tab/goto-def {:desc "Go-to in new tab"})
      (map! :nx :<C-\>h toggle-inlay-hints {:desc "Toggle inlay hints"})
      (each [_ server (ipairs servers)]
        (vim.lsp.enable server)))))

(use! :neovim/nvim-lspconfig
      {:config setup-lsp})
