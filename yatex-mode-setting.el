 (setq load-path (cons "~/elisp/auctex" load-path))
 (setq auto-mode-alist
       (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
 (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t) 
 (setq tex-command "platex-utf8")
 (setq YaTeX-kanji-code 4)
 (setq YaTeX-use-LaTeX2e t)
 (setq YaTeX-use-AMS-LaTeX t)
 (setq YaTeX-use-hilit19 nil
       YaTeX-use-font-lock t)
