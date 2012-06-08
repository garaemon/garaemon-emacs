(require 'euslisp-mode)
(setq auto-mode-alist (cons (cons "\\.l$" 'euslisp-mode) auto-mode-alist))

(defun lisp-other-window ()
  "Run lisp on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*inferior-lisp*"))
  (run-lisp inferior-euslisp-program))

(set-variable 'inferior-euslisp-program "rosrun roseus roseus")
(global-set-key "\C-cE" 'lisp-other-window)
