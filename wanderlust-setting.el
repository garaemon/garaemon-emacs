(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
(setq auto-mode-alist
      (cons (cons ".wl$" 'emacs-lisp-mode) auto-mode-alist))
