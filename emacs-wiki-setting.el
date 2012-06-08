(require 'garaemon-util)

(when-emacs22
 (setq load-path (cons "~/elisp/emacs-wiki" load-path))
 (setq load-path (cons "~/elisp/planner" load-path))
 (require 'emacs-wiki)

 (defun emacs-wiki-get-modtime (file)
   (format-time-string " %Y/%m/%d %h:%M:%S " (nth 4 (file-attributes file))))

 (defun emacs-wiki-get-filesize (file)
   (format "<center> %d </center>" (nth 7 (file-attributes file))))
;;; emacs-wiki-publishing-{header, footer} 用

 (defun emacs-wiki-project-insert-header (project)
   "project 名を prefix とした header を挿入"
   (emacs-wiki-project-insert-templete (symbol-name project) "-header"))

 (defun emacs-wiki-project-insert-footer (project)
   "project 名を prefix とした footer を挿入"
   (emacs-wiki-project-insert-templete (symbol-name project) "-footer"))

 (defun emacs-wiki-project-insert-templete (project templete)
   "project 名 + テンプレート名 のファイル内容を挿入"
   (let ((file (concat "~/Wiki/wiki/" project templete)))
     (when (file-readable-p file)
       (ignore (insert-file-contents file)))))

;;; <lisp> ... </lisp> 用
 (defun emacs-wiki-figure-with-class (class url width height caption)
   "caption 付きの図を挿入する関数 (クラス指定付き)"
   (format (concat "<nowiki><div class=\"%s\"><a href=\"%s\">"
		   "<img width=\"%s\" height=\"%s\" src=\"%s\" /></a>\n"
		   "<p class=\"caption\">%s</p></div></nowiki>")
	   class url width height url caption))

 (defun emacs-wiki-figure (url width height caption)
   "caption 付きの図を挿入"
   (emacs-wiki-figure-with-class "fig" url width height caption))

 (defun emacs-wiki-figure-right (url width height caption)
   "caption 付きの図を挿入 (float: right)"
   (emacs-wiki-figure-with-class "figright" url width height caption))

 (defun emacs-wiki-figure-left (url width height caption)
   "caption 付きの図を挿入 (float: left)"
   (emacs-wiki-figure-with-class "figleft" url width height caption))

 (require 'planner)
 (require 'emacs-wiki-menu)

 (setq emacs-wiki-directories '("~/ewiki/wiki"))
 (setq planner-directory "~/plans")
 (setq emacs-wiki-publishing-directory "~/ewiki/www")
 (setq emacs-wiki-maintainer "garaemon@gmail.com")
 (setq emacs-wiki-inline-images t)
 (setq emacs-wiki-publishing-transforms '(("WelcomePage" . "index")))
 (setq emacs-wiki-meta-content-coding "UTF-8")
 (setq emacs-wiki-charset-default "UTF-8")

 (custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(emacs-wiki-footer-date-format "%Y-%m-%d %T")
  '(emacs-wiki-link-face ((t (:foreground "blue"))))
  '(emacs-wiki-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">")
  '(safe-local-variable-values (quote ((Syntax . Common-lisp)
				       (Package . XLIB)
				       (Lowercase . Yes)
				       (Syntax . ANSI-Common-Lisp)
				       (Base . 10)
				       (Package . CLIM-CLX)
				       (Package JPEG :use (common-lisp))
				       (Syntax . COMMON-LISP)))))
 )

