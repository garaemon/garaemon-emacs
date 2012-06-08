(require 'garaemon-util)

(cond
 ((meadowp)
  (setq migemo-directory "c:/cygwin/usr/local/share/migemo")
  (load "migemo"))
 ((cygwinp)
  (setq migemo-directory "/usr/local/share/migemo")
  (load "migemo"))
 ((or (cocoa-emacs-p) (carbon-emacs-p))
  (setq load-path (cons "~/elisp/migemo" load-path))
  (load "migemo.el")
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  (setq migemo-dictionary "/usr/local/share/migemo/euc-jp/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil))
 (t					;Linux
  ;;(setq migemo-directory "/usr/local/share/migemo")
  (setq migemo-directory "/usr/share/migemo")
  (load "migemo")
  (migemo-init))
 )
