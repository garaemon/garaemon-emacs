;; -*- mode: emacs-lisp -*-
(require 'garaemon-util)
;; anthy
(when (or (eq system-type 'cygwin)
	  (eq system-type 'gnu/linux))
  (setq load-path (append '("/usr/share/emacs/site-lisp/anthy/")
			  load-path))
  (load-library "anthy")
  (global-unset-key "\C-\\")
  (setq default-input-method "japanese-anthy")
  (global-set-key "\C-\\" 'anthy-mode))

;; ;; anthying-cheat-sheat-popup
;; (require 'anything-cheat-sheat-popup)

;; ;; (defanything-cheat-sheat emacs-lisp                ;name, must be unique
;; ;;   (emacs-lisp-mode lisp-interaction-mode)          ;major mode list
;; ;;   "~/org/cheat-sheat/emacs-lisp.org")              ;cheat file name

;; ;; (defanything-cheat-sheat slime
;; ;;   (slime-repl-mode)
;; ;;   "~/org/cheat-sheat/slime.org")

;; ;; (defanything-cheat-sheat org
;; ;;   (org-mode)
;; ;;   "~/org/cheat-sheat/org.org")

;; ;;;; bind to M-h
;; ;;(global-set-key "\M-h" 'anything-cheat-sheat)

;; helm
(require 'helm-config)
(global-set-key "\C-xb" 'helm-mini)

;; ;; anything-grep
;; (require 'helm-grep)
;; (setq helm-grep-alist
;;       ;; 全バッファのファイル名においてegrepをかける。moccurの代わり。
;;       '(("buffers" ("egrep -Hin %s $buffers" "/"))
;; 	;; ~/memo 以下から再帰的にegrepをかける。不要なファイルは除かれる。
;; 	("memo" ("ack-grep -af | xargs egrep -Hin %s" "~/memo"))
;; 	;; ~/doc/postgresql-74 から *.txt に対してegrepをかける。
;; 	("PostgreSQL" ("egrep -Hin %s *.txt" "~/doc/postgresql-74/"))
;; 	;; ~/prog以下のファイルをまとめて検索する。
;; 	("~/prog"
;; 	 ("ack-grep -af | xargs egrep -Hin %s" "~/prog"))
;; 	))
;; ;;
;; (global-set-key "\C-c;" 'helm-grep)
;; (global-set-key "\C-c:" 'helm-grep-by-name)
;; (require 'helm)
;; (require 'helm-config)
;; ;;(require 'helm-rospack)
;; (setq helm-sources
;;       (list helm-c-source-buffers
;;             ;;helm-c-rospack-source
;;             helm-c-source-file-name-history
;;             helm-c-source-imenu
;;             helm-c-source-recentf
;;             ;;helm-c-source-man-pages
;;             ;;helm-c-source-info-pages
;;             helm-c-source-calculation-result
;;             helm-c-source-kill-ring
;;             ;;helm-c-source-bookmarks
;;             ;;helm-c-source-locate))
;;             ))

;; (global-set-key "\C-xb" 'helm)
;; (global-set-key "\M-y" 'helm-show-kill-ring)
;; ;;(global-set-key [?\C-;] 'iswitchb-buffer)
;; (helm-iswitchb-setup)

;; (define-key helm-map (kbd "C-p") 'helm-previous-line)
;; (define-key helm-map (kbd "C-n") 'helm-next-line)
;; (define-key helm-map (kbd "C-v") 'helm-next-source)
;; (define-key helm-map (kbd "M-v") 'helm-previous-source)
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))

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

(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-h" 'help-for-help)

;; (require 'bm)
;; (global-set-key [?\C-;] 'bm-previous)
;; (global-set-key [?\C-:] 'bm-next)
;; (global-set-key [?\C-\M- ] 'bm-toggle)



(when-carbon
 (require 'carbon-font)
 (setq mac-allow-anti-aliasing t)
 (fixed-width-set-fontset "hiramaru" 12))

(setq auto-mode-alist (cons (cons "\\.cg?$" 'c-mode) auto-mode-alist))

(autoload 'clmemo "clmemo" "ChangeLog memo mode." t)
;; あなたの ChangeLog メモファイルへのパス
(setq clmemo-file-name "~/Documents/changelog/ChangeLog")
;; 好きなキーへバインド
(global-set-key "\C-xM" 'clmemo)
;; タイトルの補完
(setq clmemo-title-list '("idea" "bookmark" "Emacs" "EusLisp" "Research"))

(when-cocoa
 ;; フォントフェースの設定
 ;; see http://d.hatena.ne.jp/kazu-yamamoto/20090122/1232589385
 (set-face-attribute 'default nil
		     :family "monaco"
		     :height 120)
 ;; 日本語フォント: ヒラギノ丸ゴシック 
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0208
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'katakana-jisx0201
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0212
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 )

(when-cocoa
 (setq ns-command-modifier (quote meta))
 (setq ns-alternate-modifier (quote super)))

(require 'column-marker)

(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-2 80)))
(add-hook 'c++-mode-hook (lambda () (interactive) (column-marker-2 80)))
(add-hook 'lisp-mode-hook (lambda () (interactive) (column-marker-2 80)))

(global-set-key "\C-x;" 'comment-region)
(fset 'uncomment-region "\C-u\C-[xcomment-region\C-m")
(global-set-key "\C-x:" 'uncomment-region)

(when-meadow
 (setq inhibit-default-init t))

(setq auto-mode-alist (cons (cons "\\.cu?$" 'c-mode) auto-mode-alist))

(when (eq window-system 'windows-nt)
  (require 'cygwin-mount-mw32)
  (cygwin-mount-activate))

(global-set-key "\C-o" 'dabbrev-expand)


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

(line-number-mode 1)
(column-number-mode 1)

(display-time)

(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)


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

(setq-default transient-mark-mode t)

(modify-coding-system-alist 'process "\\*eshell\\*" 'undecided-unix)
(require 'eshell)
(defun eshell-scroll-to-bottom (window display-start)
  (if (and window (window-live-p window))
      (let ((resize-mini-windows nil))
        (save-selected-window
          (select-window window)
          (save-restriction
            (widen)
            (when (> (point) eshell-last-output-start)
              ;; we're editing a line. Scroll.
              (save-excursion
                (recenter -1)
                (sit-for 0))))))))
(defun eshell-add-scroll-to-bottom ()
  (interactive)
  (make-local-hook 'window-scroll-functions)
  (add-hook 'window-scroll-functions 'eshell-scroll-to-bottom nil t))

(add-hook 'eshell-mode-hook 'eshell-add-scroll-to-bottom)
;; ;;clear
(defun eshell/clear ()
  "Clear the current buffer, leaving one prompt at the top."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-ask-to-save-history (quote always))
 '(eshell-history-size 1000)
 '(eshell-ls-dired-initial-args (quote ("-h")))
 '(eshell-ls-exclude-regexp "~\\'")
 '(eshell-ls-use-in-dired t nil (em-ls))
 '(eshell-modules-list (quote (eshell-alias
                               eshell-basic
                               eshell-cmpl
                               eshell-dirs
                               eshell-glob
                               eshell-ls
                               eshell-pred
                               eshell-prompt
                               eshell-rebind
                               eshell-script
                               eshell-smart
                               eshell-term
                               eshell-unix
                               eshell-xtra)))
 '(eshell-prefer-o-shell t nil (eshell))
 '(eshell-stringify-t nil)
 '(eshell-term-name "ansi")
 '(eshell-visual-commands (quote ("vi" "top" "screen" "less" "lynx" "ssh" "rlogin" "telnet"))))

;; ;;current directory
(defun eshell-cd-default-directory ()
  (interactive)
  (let ((dir default-directory))
    (eshell)
    (cd dir)
    (eshell-interactive-print (concat "cd " dir "\n"))
    (eshell-emit-prompt)))

;; ;;prompt
(setq eshell-prompt-function
      (lambda ()
        (concat "[Yes,Master?] "
                (eshell/pwd)
                (if (= (user-uid) 0) "]# " "]$ ")
                )))
(setq eshell-prompt-regexp "^[^#$]*[$#] ")

;;less
(defun eshell/less (&rest args)
  "Invoke `view-file' on the file.
\"less +42 foo\" also goes to line 42 in the buffer."
  (while args
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
        (let* ((line (string-to-number (match-string 1 (pop args))))
               (file (pop args)))
          (view-file file)
          (goto-line line))
      (view-file (pop args)))))

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

(add-hook
 'tex-mode-hook
 '(lambda()
    (flyspell-mode)
    (local-set-key [(control .)] 'flyspell-auto-correct-word)))

;; (require 'anything-cheat-sheat-popup)

;; (defanything-cheat-sheat emacs-lisp                ;name, must be unique
;;   (emacs-lisp-mode lisp-interaction-mode)          ;major mode list
;;   "~/org/cheat-sheat/emacs-lisp.org")              ;cheat file name

;; (defanything-cheat-sheat slime
;;   (slime-repl-mode)
;;   "~/org/cheat-sheat/slime.org")

;; (defanything-cheat-sheat org
;;   (org-mode)
;;   "~/org/cheat-sheat/org.org")

;; bind to M-h
(global-set-key "\M-h" 'anything-cheat-sheat)

;; disable js2-mode, it's heavy
;; (require 'js2-mode)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;(setq js2-bounce-indent-flag nil)
;;(define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)

;;(autoload 'js-mode "js")
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (js--proper-indentation parse-status))
           node)
      (save-excursion
        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ js-indent-level 2))))
        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))
      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-indent-sexp ()
  (interactive)
  (save-restriction
    (save-excursion
      (widen)
      (let* ((inhibit-point-motion-hooks t)
             (parse-status (syntax-ppss (point)))
             (beg (nth 1 parse-status))
             (end-marker (make-marker))
             (end (progn (goto-char beg) (forward-list) (point)))
             (ovl (make-overlay beg end)))
        (set-marker end-marker end)
        (overlay-put ovl 'face 'highlight)
        (goto-char beg)
        (while (< (point) (marker-position end-marker))
          ;; don't reindent blank lines so we don't set the "buffer
          ;; modified" property for nothing
          (beginning-of-line)
          (unless (looking-at "\\s-*$")
            (indent-according-to-mode))
          (forward-line))
        (run-with-timer 0.5 nil '(lambda(ovl)
                                   (delete-overlay ovl)) ovl)))))
(defun my-js2-mode-hook ()
  (require 'js)
  (setq js-indent-level 2
        indent-tabs-mode nil
        c-basic-offset 2)
  (c-toggle-auto-state 0)
  (c-toggle-hungry-state 1)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
;  (define-key js2-mode-map [(meta control |)] 'cperl-lineup)
  (define-key js2-mode-map [(meta control \;)]
    '(lambda()
       (interactive)
       (insert "/* -----[ ")
       (save-excursion
         (insert " ]----- */"))
       ))
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (define-key js2-mode-map [(control meta q)] 'my-indent-sexp)
  (if (featurep 'js2-highlight-vars)
    (js2-highlight-vars-mode))
  (message "My JS2 hook"))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)

(define-key global-map [165] nil)
(define-key global-map [67109029] nil)
(define-key global-map [134217893] nil)
(define-key global-map [201326757] nil)
(define-key function-key-map [165] [?\\])
(define-key function-key-map [67109029] [?\C-\\])
(define-key function-key-map [134217893] [?\M-\\])
(define-key function-key-map [201326757] [?\C-\M-\\])

(autoload 'goby "goby" nil t)

(defun gcode-lookup ()
  "カーソル位置のシンボルをGoogle Codeで検索(lisp決め打ち)"
  (interactive)
  (browse-url
   (format
    "http://www.google.com/codesearch?q=%s+lang:%s+file:\\.%s$&hl=ja&num=20"
    (thing-at-point 'symbol) "lisp" "lisp")))
(global-set-key "\C-cs" 'gcode-lookup)

(global-set-key "\M-g" 'goto-line)


(when t
  (when-gui
   ;; 文字の色を設定します。
   (set-foreground-color "white")
   ;; 背景色を設定します。
   (set-background-color "black")
   ;; モードラインの文字の色を設定します。
   (set-face-foreground 'modeline "white")
   ;; モードラインの背景色を設定します。
   (set-face-background 'modeline "gray40")
   ;; カーソルの色を設定します。
   (set-cursor-color "yellow")
   ;; マウスポインタの色を設定します。
   (set-mouse-color  "yellow")
   )
  (when-gui
   ;; 透明に
   (set-frame-parameter nil 'alpha '(85 70)))
  )

(cond ((carbon-emacs-p)
       (setq default-frame-alist
	     (append (list '(alpha . (90 90))) default-frame-alist)))
      ((meadowp)
       (modify-all-frames-parameters
        (list (cons 'alpha  '(nil nil nil nil)))))
      )

(setq auto-mode-alist
      (append auto-mode-alist
	      '(("\\.[hg]s$"  . haskell-mode)
		("\\.hi$"     . haskell-mode)
		("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
  "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
  "Major mode for editing literate Haskell scripts." t)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(setq haskell-literate-default 'latex)
(setq haskell-doc-idle-delay 0)

(global-set-key "\C-c(" 'hs-hide-block)
(global-set-key "\C-c)" 'hs-show-block)
(global-set-key "\C-c{" 'hs-hide-all)
(global-set-key "\C-c}" 'hs-show-all)

(setq auto-mode-alist (cons (cons "\\.html$" 'html-mode)
			    auto-mode-alist))

(global-set-key "\C-x\C-b" 'ibuffer)

(setq completion-ignore-case t)

(global-set-key "\C-cg" 'imenu)

(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)

(setq c-default-style "stroustrup")

(eval-after-load "ispell"
  '(setq ispell-skip-region-alist
	 (cons '("[^¥000-¥377]")
	       ispell-skip-region-alist)))

(iswitchb-mode 1)

(global-unset-key "\C-\\")
(when (carbon-emacs-p)
 (mac-input-method-mode 1))


(prefer-coding-system 'utf-8)
(set-language-environment "Japanese")

(font-lock-add-keywords 'lisp-mode
			(list
			 ;; *hoge*に色を付ける
			 (list "\\(\\*\\w\+\\*\\)\\>"
			       '(1 font-lock-constant-face nil t))
			 ;; +hoge+に色を付ける
			 (list "\\(\\+\\w\+\\+\\)\\>"
			       '(1 font-lock-constant-face nil t))
			 ;; <hoge>に色を付ける
			 (list "\\(<\\w\+>\\)\\>"
			       '(1 font-lock-constant-face nil t))
			 ;; defclass*に色を付ける
			 (list "\\(defclass\\*\\)"
			       '(1 font-lock-keyword-face nil t))
			))

(defun cl-indent (sym indent)
  (put sym 'common-lisp-indent-function
       (if (symbolp indent)
	   (get indent 'common-lisp-indent-function)
	 indent)))

(cl-indent 'iterate 'let)
(cl-indent 'collect 'progn)
(cl-indent 'mapping 'let)
(cl-indent 'mapping 'let)
(cl-indent 'define-test 'let)

;; magit!
(add-to-list 'exec-path "/opt/local/bin")
(require 'magit)
(global-set-key "\C-cl" 'magit-status)

(require 'markdown-mode)

(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

(when-meadow
 (let ((make-spec
	(function
	 (lambda (size charset fontname &optional windows-charset)
	   (setq size (- size))
	   (if (not windows-charset)
	       (setq windows-charset
		     (cadr (assq charset
				 mw32-charset-windows-font-info-alist))))
	   `(((:char-spec ,charset :height any)
	      strict
	      (w32-logfont ,fontname 0 ,size 400 0
			   nil nil nil ,windows-charset 1 3 0))
	     ((:char-spec ,charset :height any :weight bold)
	      strict
	      (w32-logfont ,fontname 0 ,size 700 0
			   nil nil nil ,windows-charset 1 3 0)
	      ((spacing . -1)))
	     ((:char-spec ,charset :height any :slant italic)
	      strict
	      (w32-logfont ,fontname 0 ,size 400 0
			   t nil nil ,windows-charset 1 3 0))
	     ((:char-spec ,charset :height any :weight bold :slant italic)
	      strict
	      (w32-logfont ,fontname 0 ,size 700 0
			   t nil nil ,windows-charset 1 3 0)
	      ((spacing . -1)))))))
       (make-spec-list
	(function
	 (lambda (size params-list)
           (list
	    (cons 'spec
		  (apply 'append
			 (mapcar (lambda (params)
				   (apply make-spec (cons size params)))
				 params-list)))))))
       (define-fontset
	 (function
	  (lambda (fontname size fontset-list)
	    (let ((spec (funcall make-spec-list size fontset-list)))
	      (if (w32-list-fonts fontname)
		  (w32-change-font fontname spec)
		(w32-add-font fontname spec))))))
       (arisaka-fontset-list
	'((ascii "monaco")
	  (katakana-jisx0201 "ARISAKA-等幅")
	  (japanese-jisx0208 "ARISAKA-等幅")))
       )
   (funcall define-fontset "Arisaka 10" 10 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 12" 12 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 14" 14 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 16" 16 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 18" 18 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 20" 20 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 22" 22 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 24" 24 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 36" 36 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 48" 48 arisaka-fontset-list)
   )
 ;; 初期フレームの設定
 (setq default-frame-alist
       (append (list '(font . "Arisaka 12")
		     '(ime-font . (w32-logfont "Arisaka"
					       0 16 400 0 nil nil nil
					       128 1 3 49))) ; TrueType のみ
	       default-frame-alist))
 )

(when-meadow
 (setq w32-hide-mouse-on-key t))

(when nil                               ;disable migemo
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
 ))

;;=============================================
;;               mode-info
;;---------------------------------------------
;; http://www.namazu.org/~tsuchiya/elisp/mode-info.html
;; M-x mode-info-make-all-indicesでインデックス作成
;; M-x help-for-help f setqとかするらしいがうまくうごかん.
;; M-.でもつかえるとか
;;=============================================

;; (require 'mi-config)
;; (setq mode-info-index-directory "~/Documents/info/index")
;; (setq Info-directory-list
;;       (append
;;        Info-default-directory-list
;;        (list
;; 	(expand-file-name "~/Documents/info")
;; 	(expand-file-name "~/Documents/info/glibc-2.3.2"))))
;; (define-key global-map "\C-chf" 'mode-info-describe-function)
;; (define-key global-map "\C-chv" 'mode-info-describe-variable)
;; (define-key global-map "\M-." 'mode-info-find-tag)
;; (require 'mi-fontify)
;; (setq mode-info-class-alist
;;       '((elisp  emacs-lisp-mode lisp-interaction-mode)
;; 	(libc   c-mode c++-mode)
;; 	(make   makefile-mode)
;; 	(perl   perl-mode cperl-mode eperl-mode)
;; 	(ruby   ruby-mode)
;; 	(gauche scheme-mode scheme-interaction-mode inferior-scheme-mode)))

(require 'muse-mode)
(require 'muse-html)
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-docbook)
(require 'muse-book)
(require 'muse-wiki)
(require 'muse-project)
(add-to-list 'muse-project-alist
             '("Default"
               ("~/muse/default" :default "index")
               (:base "html" :path "~/muse/default/html")))
(add-to-list 'muse-ignored-extensions "DS_store")
(defvar *muse-root* (expand-file-name "~/muse/default"))

(setq navi2ch-article-auto-range nil)
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)
(setq navi2ch-list-bbstable-url
      "http://azlucky.s25.xrea.com/2chboard/bbsmenu2.html")

(setq visible-bell t)
(setq make-backup-files nil)

(unless-cygwin
 (scroll-bar-mode -1))
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\|kml\\|gpx\\)\\'" . nxml-mode)
            auto-mode-alist))
(global-unset-key "\M-p")
(global-unset-key "\M-n")

(defun scroll-up-in-place (n)
  (interactive "p")
  (previous-line n)
  (scroll-down n))

(defun scroll-down-in-place (n)
  (interactive "p")
  (next-line n)
  (scroll-up n))

(global-set-key "\M-p" 'scroll-up-in-place)
(global-set-key [M-up] 'scroll-up-in-place)
(global-set-key "\M-n" 'scroll-down-in-place)
(global-set-key [M-down] 'scroll-down-in-place)
;; (require 'org-blog)
;; (require 'anything-org-blog)

;; (global-set-key "\M-o" 'anything-org-blog)

;; (setq org-export-with-toc nil)
;; (setq org-export-with-section-numbers nil)
;; (setq org-blog-max-article-num 5)
;; (setq org-blog-max-recent-article-num 15)
;; (setq org-blog-root-dir "~/Dropbox/org/garaemon.net")
;; (setq org-blog-output-root-dir "~/Dropbox/org/garaemon.net-output")
;; (setq org-blog-menu-file "menu.org")
;; (setq org-blog-title "garaemon.net: 脳汁でコードを書く")
;; (setq org-blog-url "http://garaemon.net/org")
;; (setq org-blog-rss-description "generated by org-blog")
;; (setq org-blog-rss-file "rss.rdf")
;; (setq org-blog-file-suffix "org")
;; (setq org-blog-update-command "~/Dropbox/org/garaemon.net/update.sh")
;; (setq org-blog-styles
;;       '("<link rel=\"stylesheet\" type=\"text/css\" href=\"worg.css\" />"))

(require 'org)
(require 'org-remember)
(require 'remember)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(org-remember-insinuate)
(setq org-directory "~/memo/")
(setq org-default-notes-file (concat org-directory "agenda.org"))
(setq org-remember-templates
      '(("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")
        ("Bug" ?b "** TODO %?   :bug:\n   %i\n   %a\n   %t" nil "Inbox")
        ("Idea" ?i "** %?\n   %i\n   %a\n   %t" nil "New Ideas")
        ))
(defvar org-code-reading-software-name nil)

(defvar org-code-reading-file "code-reading.org")
(defun org-code-reading-read-software-name ()
  (set (make-local-variable 'org-code-reading-software-name)
       (read-string "Code Reading Software: " 
                    (or org-code-reading-software-name
                        (file-name-nondirectory
                         (buffer-file-name))))))

(defun org-code-reading-get-prefix (lang)
  (concat "[" lang "]"
          "[" (org-code-reading-read-software-name) "]"))

(defun org-remember-code-reading ()
  (interactive)
  (let* ((prefix (org-code-reading-get-prefix (substring (symbol-name major-mode) 0 -5)))
         (org-remember-templates
          `(("CodeReading" ?r "** %(identity prefix)%?\n   \n   %a\n   %t"
             ,org-code-reading-file "Memo"))))
    (org-remember)))

(setq org-log-done t)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/memo/agenda.org"
			     "~/memo/software.org"))
;; (defun set-pretty-patterns (patterns)
;;   (loop for (glyph . pairs) in patterns do
;; 	(loop for (regexp . major-modes) in pairs do
;; 	      (loop for major-mode in major-modes do
;; 		    (let ((major-mode (intern
;; 				       (concat (symbol-name major-mode)
;; 					       "-mode")))
;; 			  (n (if (string-match "\\\\([^?]" regexp) 1 0)))
;; 		      (font-lock-add-keywords
;; 		       major-mode
;; 		       `((,regexp (0 (prog1 ()
;; 				       (compose-region (match-beginning ,n)
;; 						       (match-end ,n)
;; 						       ,glyph)))))))))))

;; (set-pretty-patterns
;;  '((?λ ("\\<lambda\\>" lisp lisp-interaction emacs-lisp scheme))))


;;(add-hook 'python-mode-hook
;;          '(lambda()
;;             (require 'pycomplete)))
;;(require 'ipython)
;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(eval-after-load "pymacs"
  '(add-to-list 'pymacs-load-path "YOUR-PYMACS-DIRECTORY"))
;; python-mode, pycomplete 
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
;;(add-hook 'python-mode-hook '(lambda ()
;;                               (require 'pycomplete)
;;                               ))
(setq ipython-command "/usr/bin/ipython")
(setq py-python-command-args '( "-colors" "Linux"))
;;(require 'ipython)

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

(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point
  "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)

(cond
 ((meadowp)
  (setq shell-file-name "c:/cygwin/bin/zsh.exe")
  (modify-coding-system-alist 'process ".*sh\\.exe" 'undecided-unix))
 ((cygwinp)
  (setq shell-file-name "/bin/zsh"))
 (t
  (setq shell-file-name "zsh")))
(setq explicit-shell-file-name shell-file-name)
(setq shell-command-option "-c")
(setq system-uses-terminfo nil)
(setq shell-file-name-chars "~/A-Za-z0-9_^$!#%&{}@`'.,:()-")
;; shell-exにパスを通す
(setq load-path (cons "~/elisp/shell-ex" load-path))
;; C-lでシェルをクリアするようにする
(defun shell-clear()
  "In shell-mode,clear all display and move cursor top of the buffer."
  (interactive)
  (recenter 0))
(eval-after-load "shell"
  '(define-key shell-mode-map "\C-l" 'shell-clear))

;;shell-modeでlsしたとき色を表示
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;(shell-pop-set-internal-mode-shell "/bin/zsh")
(defvar ansi-term-after-hook nil)
(add-hook 'ansi-term-after-hook
          (function
           (lambda ()
             (define-key term-raw-map "\C-t" 'shell-pop))))
(defadvice ansi-term (after ansi-term-after-advice (arg))
  "run hook as after advice"
  (run-hooks 'ansi-term-after-hook))
(ad-activate 'ansi-term)

(auto-image-file-mode)

(show-paren-mode t)
(setq show-paren-style 'mixed)

;; here we need to load clbuild's slime
(when (file-exists-p "~/gprog/clbuild/source/slime")
  (setq load-path (cons "~/gprog/clbuild/source/slime" load-path))
  (setq load-path (cons "~/gprog/clbuild/source/slime/contrib" load-path))
  (setq slime-backend "~/gprog/clbuild/.swank-loader.lisp")
  (setq inhibit-splash-screen t)
  (load "~/gprog/clbuild/source/slime/slime")
  )

(setq inferior-lisp-program "~/gprog/clbuild/clbuild lisp")
(setq slime-net-coding-system 'utf-8-unix)

(defun slime-other-window ()
  "Run slime on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*inferior-lisp*"))
  (slime))

(eval-when-compile 
  (require 'cl))

(setq slime-keys
  '( ;; Compiler notes
    ;;    ("\M-p"       slime-previous-note)
    ;;    ("\M-n"       slime-next-note)
    ("\C-c\M-c"   slime-remove-notes)
    ("\C-c\C-k"   slime-compile-and-load-file)
    ("\C-c\M-k"   slime-compile-file)
    ("\C-c\C-c"   slime-compile-defun)))

(require 'slime)
(slime-setup '(slime-fancy slime-tramp slime-asdf))
(slime-require :swank-listener-hooks)

(add-hook 'lisp-mode-hook 
	  (lambda () 
	    (slime-mode t)
	    (local-set-key [(control ?c) ?\;]        'slime-insert-balanced-comments)
	    (local-set-key [(control ?c) (meta ?\;)] 'slime-remove-balanced-comments)
	    (show-paren-mode t)
	    ))

(eval-after-load "slime"
  '(progn
     (slime-setup '(inferior-slime
                    slime-asdf
                    slime-autodoc
                    slime-banner
                    slime-c-p-c
                    slime-editing-commands
                    slime-fancy-inspector
                    slime-fancy
                    slime-fuzzy
                    ;;slime-highlight-edits
                    slime-parse
                    ;;slime-presentation-streams
                    ;;slime-presentations
                    slime-references
                    slime-scratch
                    slime-tramp
                    ;;slime-typeout-frame
                    slime-xref-browser
                    ))
     (setq slime-complete-symbol*-fancy t
           browse-url-firefox-program (if (memq system-type '(darwin)) "open" "clhs")
	   slime-complete-symbol-function 'slime-fuzzy-complete-symbol
	   common-lisp-hyperspec-root (concat "file://"
					      (expand-file-name "~/Documents/hyperspec/HyperSpec/"))
	   browse-url-browser-function 'browse-url-firefox)
     ))

(add-hook 'slime-mode-hook
	  (lambda ()
	    (setq lisp-indent-function 'common-lisp-indent-function)
	    (cl-indent 'iterate 'let)
	    (cl-indent 'collect 'progn)
	    (cl-indent 'mapping 'let)
	    (cl-indent 'mapping 'let)))
(slime-autodoc-mode)
(global-set-key "\C-cC" 'slime-other-window)

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)


(defun file-root-p (filename)
  "Return t if file FILENAME created by root."
  (eq 0 (nth 2 (file-attributes filename))))

(defun th-rename-tramp-buffer ()
  (when (file-remote-p (buffer-file-name))
    (rename-buffer
     (format "%s:%s"
             (file-remote-p (buffer-file-name) 'method)
             (buffer-name)))))

(add-hook 'find-file-hook
          'th-rename-tramp-buffer)

(defadvice find-file (around th-find-file activate)
  "Open FILENAME using tramp's sudo method if it's read-only."
  (if (and (file-root-p (ad-get-arg 0))
           (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat "File "
                             (ad-get-arg 0)
                             " is read-only.  Open it as root? ")))
      (th-find-file-sudo (ad-get-arg 0))
    ad-do-it))

(defun th-find-file-sudo (file)
  "Opens FILE with root privileges."
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))

(setq thumbs-thumbsdir
      (expand-file-name "~/.emacs-thumbs"))
(setq thumbs-temp-dir "/tmp")

(require 'tramp)
(setq tramp-default-method "sshx")

(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

(if (file-exists-p "~/.twittering")
    (load "~/.twittering")
  (message "there is no ~/.twittering"))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
(setq auto-mode-alist
      (cons (cons ".wl$" 'emacs-lisp-mode) auto-mode-alist))

(require 'which-func)
(setq which-func-modes
      (append which-func-modes
	      '(lisp-mode slime-mode)))
(which-func-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.\\(yml\\|yaml\\)$" . yaml-mode))

;;  (setq load-path (cons "~/elisp/auctex" load-path))
;;  (setq auto-mode-alist
;;        (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;;  (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t) 
;;  (setq tex-command "platex-utf8")
;;  (setq YaTeX-kanji-code 4)
;;  (setq YaTeX-use-LaTeX2e t)
;;  (setq YaTeX-use-AMS-LaTeX t)
;;  (setq YaTeX-use-hilit19 nil
;;        YaTeX-use-font-lock t)

;; (require 'zone)
;; (zone-when-idle 10000)


(provide 'garaemon-dot-emacs)

