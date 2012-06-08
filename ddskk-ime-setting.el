(require 'garaemon-util)

(setq mac-pass-control-to-system nil)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
 (when-darwin
  (setq skk-server-host "localhost")
  (setq skk-jisyo-code 'utf-8-unix)
  (setq skk-server-portnum 1178))
 
(setq skk-henkan-show-candidates-keys '(?a ?o ?e ?u ?h ?t ?n))
(setq skk-kutouten-type 'en)
