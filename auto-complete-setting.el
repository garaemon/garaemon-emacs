(when (require 'auto-complete nil t)
  (require 'auto-complete-config)
  (global-auto-complete-mode t)
  (define-key ac-complete-mode-map "\t" 'ac-expand)
  (define-key ac-complete-mode-map "\r" 'ac-complete)
  (define-key ac-complete-mode-map "\M-n" 'ac-next)
  (define-key ac-complete-mode-map "\M-p" 'ac-previous)
  (setq ac-auto-start 2)
  (setq ac-dwim t)
  (set-default 'ac-sources '(ac-source-yasnippet
			     ac-source-abbrev
			     ac-source-words-in-buffer))
  (setq ac-modes
	(append ac-modes
		'(emacs-lisp-mode
		  lisp-mode
		  ;;org-mode
		  )))
  (add-hook 'emacs-lisp-mode-hook
	    (lambda ()
	      (setq ac-sources '(ac-source-yasnippet
				 ac-source-abbrev
				 ac-source-words-in-buffer
				 ac-source-symbols))))
  )
