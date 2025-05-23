(import-macros {: use!} :macros.vim)

(let [blink-version :v1.2.0]
  (use! :saghen/blink.cmp
      {:enabled true
       :version blink-version
       :dependencies [(use! :L3MON4D3/LuaSnip {:version :v2.*})]
       ; :build "cargo build --release"
       :opts {:snippets {:preset :luasnip}
              :completion {:ghost_text {:enabled true}}
              :fuzzy {:implementation :rust
                      :prebuilt_binaries {:force_version blink-version}}}}))
