;;=============================================
;;               mode-info
;;---------------------------------------------
;; http://www.namazu.org/~tsuchiya/elisp/mode-info.html
;; M-x mode-info-make-all-indicesでインデックス作成
;; M-x help-for-help f setqとかするらしいがうまくうごかん.
;; M-.でもつかえるとか
;;=============================================

(require 'mi-config)
(setq mode-info-index-directory "~/Documents/info/index")
(setq Info-directory-list
      (append
       Info-default-directory-list
       (list
	(expand-file-name "~/Documents/info")
	(expand-file-name "~/Documents/info/glibc-2.3.2"))))
(define-key global-map "\C-chf" 'mode-info-describe-function)
(define-key global-map "\C-chv" 'mode-info-describe-variable)
(define-key global-map "\M-." 'mode-info-find-tag)
(require 'mi-fontify)
(setq mode-info-class-alist
      '((elisp  emacs-lisp-mode lisp-interaction-mode)
	(libc   c-mode c++-mode)
	(make   makefile-mode)
	(perl   perl-mode cperl-mode eperl-mode)
	(ruby   ruby-mode)
	(gauche scheme-mode scheme-interaction-mode inferior-scheme-mode)))
