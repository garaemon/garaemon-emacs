(require 'which-func)
(setq which-func-modes
      (append which-func-modes
	      '(lisp-mode slime-mode)))
(which-func-mode t)
