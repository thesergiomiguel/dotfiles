(fn setup-vim-lua-api [client]
  "Provides type annotations for the vim api."
  (let [has-luarc? (and client.workspace_folders
                      (let [path (. client.workspace_folders 1 :name)]
                        (and (~= path (vim.fn.stdpath "config"))
                             (or (vim.uv.fs_stat (.. path "/.luarc.json"))
                                 (vim.uv.fs_stat (.. path "/.luarc.jsonc"))))))]
   (when (not has-luarc?)
     (tset client.config.settings :Lua
       (vim.tbl_deep_extend :force
         (or (. client.config.settings :Lua) {})
         {:runtime {:version :LuaJIT
                    :path [:lua/?.lua :lua/?/init.lua]}
          :workspace {:checkThirdParty false
                      :library [vim.env.VIMRUNTIME]}})))))

{:settings {:Lua []}
 :on_init setup-vim-lua-api}
