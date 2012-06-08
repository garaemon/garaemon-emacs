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
(require 'ipython)
