(import-macros {: map! : cmd} :macros.vim)

(map! :n :<leader>q (cmd :confirm :quitall) {:desc "Quit all?"})
(map! :n :<localleader>q (cmd :confirm :quit) {:desc "Quit?"})
(map! :n :<localleader>bd (cmd :confirm :bdelete) {:desc "Delete buffer?"})
(map! :n :<localleader>bD (cmd :bdelete!) {:desc "Delete buffer!"})
(map! :n :<localleader>w (cmd :update) {:desc "Maybe :update"})
(map! :n :<localleader>W (cmd :write) {:desc "Maybe :write"})
(map! :n :<localleader>e (cmd :edit) {:desc "Edit"})

(map! :n :<M-*> "*N" {:desc "Find (c)word"})

;; moving lines/blocks in visual mode with indenting.
(map! :v :K ":m '<-2<CR>gv=gv" {:desc "Move up + indent"})
(map! :v :J ":m '>+1<CR>gv=gv" {:desc "Move down + indent"})

;; tabs
(map! :nx "<M-]>" :gt {:desc ":tabnext"})
(map! :nx "<M-[>" :gT {:desc ":tabprev"})
(map! :nx "<C-w>[" (lambda [] (pcall vim.cmd.tabmove :-1)) {:desc "Move tab left"})
(map! :nx "<C-w>]" (lambda [] (pcall vim.cmd.tabmove :+1)) {:desc "Move tab right"})
(map! :nx "<C-w>n" (cmd :tab :split) {:desc "New tab, keep cursor"})
