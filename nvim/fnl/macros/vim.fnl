;; [nfnl-macro]

(local {: string-split} (require :utils))

;;
;; Package
;;

(fn use! [pkg opts]
  "Returns a package spec."
  (let [opts (or opts {})]
    (tset opts 1 pkg)
    opts))

;;
;; Vim helpers
;;

(fn cmd [x & xs]
  (let [args [x (unpack xs)]]
    (.. :<cmd> (table.concat args " ") :<cr>)))

(fn map! [modes lhs rhs opts]
  (local default-map-opts {})
  (let [modes (icollect [c (string.gmatch modes ".")] c)
        opts# (or opts default-map-opts)]
    `(vim.keymap.set ,modes ,lhs ,rhs ,opts#)))

(fn set! [k v]
  `(tset vim.o ,k ,v))

(fn setlocal! [k v]
  `(tset vim.b ,k ,v))

(fn let-g! [k v]
  `(tset vim.g ,k ,v))

(fn get-g! [k]
  `(. vim.g ,k))

;; Utils

(fn call-nested [root path ...]
  "Calls a nested fn with optional args.
  e.g. (call-nested :nvim-tree.api :tree.toggle {: opts})"
  `(let [root# (require ,root)
         parts# ,(string-split path ".")]
     (var leaf# root#)
     (each [_# part# (ipairs parts#)]
       (set leaf# (. leaf# part#)))
     (leaf# ,...)))

{: cmd
 : map!
 : set!
 : setlocal!
 : let-g!
 : get-g!
 : use!
 : call-nested}

; TODO
; let-b!
; let-w!
;
; set-append!
; set-prepend!
; set-remove!
