(import-macros {: map! : use!} :macros.vim)

(fn setup-telescope []
  (let [telescope (require :telescope)
        builtin (require :telescope.builtin)
        actions (require :telescope.actions)
        find-cmd [:fd :--type :f :--strip-cwd-prefix :-H :-E :.git :-E :node_modules:]
        opts {:defaults {:dynamic_preview_title true
                         :mappings {:i {"<Esc>" actions.close
                                        "<C-b>" actions.delete_buffer
                                        "<C-f>" actions.to_fuzzy_refine
                                        "<C-q>" (+ actions.smart_send_to_qflist actions.open_qflist)}
                                    :n {"<C-b>" actions.delete_buffer}}}
              :pickers {:colorscheme {:enable_preview true :ignore_builtins true}
                        :find_files {:theme :ivy :find_command find-cmd}
                        :live_grep {:theme :ivy}
                        :grep_string {:theme :ivy}
                        :buffers {:theme :ivy}}}]
                        
    (do
      (telescope.setup opts)
      (do
        (map! :n "<leader>p" builtin.find_files {:desc "Find files"})
        (map! :n "<leader>f" builtin.live_grep {:desc "Live grep"})
        (map! :n "<leader><M-f>" builtin.grep_string {:desc "Find word under cursor"})
        (map! :n "<leader>b" builtin.buffers {:desc "List buffers"})
        (map! :n "<M-\\>t" builtin.resume {:desc "Resume telescope session"})
        (map! :n "<C-Space>t" builtin.builtin {:desc "Telescope"}))
      (telescope.load_extension :fzf))))

(let [fzf-native (use! :nvim-telescope/telescope-fzf-native.nvim
                       {:build "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"})]
                       
  (use! :nvim-telescope/telescope.nvim
        {:enabled true
         ; :tag :0.1.8
         :dependencies [:nvim-lua/plenary.nvim fzf-native]
         :config setup-telescope}))
