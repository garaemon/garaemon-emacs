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

