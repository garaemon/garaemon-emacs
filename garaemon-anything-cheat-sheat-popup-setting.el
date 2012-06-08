(require 'anything-cheat-sheat-popup)

(defanything-cheat-sheat emacs-lisp                ;name, must be unique
  (emacs-lisp-mode lisp-interaction-mode)          ;major mode list
  "~/org/cheat-sheat/emacs-lisp.org")              ;cheat file name

(defanything-cheat-sheat slime
  (slime-repl-mode)
  "~/org/cheat-sheat/slime.org")

(defanything-cheat-sheat org
  (org-mode)
  "~/org/cheat-sheat/org.org")

;; bind to M-h
(global-set-key "\M-h" 'anything-cheat-sheat)

