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
