(require 'garaemon-util)
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
