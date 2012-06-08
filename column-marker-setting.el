(require 'column-marker)

(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-2 80)))
(add-hook 'c++-mode-hook (lambda () (interactive) (column-marker-2 80)))
(add-hook 'lisp-mode-hook (lambda () (interactive) (column-marker-2 80)))
