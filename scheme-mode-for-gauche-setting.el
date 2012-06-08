(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "gosh")
(require 'cmuscheme)
(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(define-key global-map
  "\C-cS" 'scheme-other-window)
(setq gosh-program-name "/usr/bin/env gosh -i")
(setq scheme-program-name "gosh -i")

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(put 'if 'scheme-indent-function 2)
(put 'dotimes 'scheme-indent-function 1)
(put 'dolist 'scheme-indent-function 1)
(put 'instance 'scheme-indent-function 1)
(put 'set! 'scheme-indent-function 1)
(put 'let-keywords* 'scheme-indent-function 2)
(put 'defun 'scheme-indent-function 2)
(put 'defclass 'scheme-indent-function 2)
(put 'defmethod 'scheme-indent-function 2)
(put 'define-method* 'scheme-indent-function 2)
(put 'define-class* 'scheme-indent-function 2)
(put 'define-function* 'scheme-indent-function 1)
(put 'let-keywords 'scheme-indent-function 2)
(put 'let-optionals* 'scheme-indent-function 2)
(put 'let-optionals 'scheme-indent-function 2)
(put 'let-values 'scheme-indent-function 2)
(put 'receive 'scheme-indent-function 1)
(put 'mutex-block 'scheme-indent-function 2)
(put 'unless 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)
(put 'while 'scheme-indent-function 1)
(put 'defmethod 'scheme-indent-function 1)

;;font-lock
(font-lock-add-keywords 'scheme-mode
                        (list
                         (list (concat
                                "(" (regexp-opt '("use") t) "\\>") '(1 font-lock-keyword-face nil t))
                         (list "\\(self\\)\\>" '(1 font-lock-constant-face nil t))
                         (list "\\(\\*\\w\+\\*\\)\\>" '(1 font-lock-constant-face nil t))
                         (list "\\(#\\(\\+\\|\\-\\)\.\*\\)" '(1 font-lock-variable-name-face))
                         (cons "\\(dotimes\\|unless\\|when\\|dolist\\|while\\)\\>" 1)
                         (cons "\\(let-\\(keywords\\|optionals\\|values\\|keywords\\*\\|optionals\\*\\|values\\*\\)\\)\\>" 1)
                         (list "\\(warn\\)\\>" '(1 font-lock-warning-face))
                         (list "\\(#t\\|#f\\)\\>" '(1 font-lock-constant-face))
                         (cons "\\(defclass\\|defmethod\\)\\>" 1)
			 (cons "\\(define-\\(function\\*\\|class\\*\\|method\\*\\)\\)\\>" 1)
                         )
                        )
