(require 'anything)
(require 'anything-config)
(require 'anything-rospack)
(setq anything-sources
      (list anything-c-source-buffers
            anything-c-rospack-source
            anything-c-source-file-name-history
            anything-c-source-imenu
            anything-c-source-recentf
            ;;anything-c-source-man-pages
            ;;anything-c-source-info-pages
            anything-c-source-calculation-result
            anything-c-source-kill-ring
            ;;anything-c-source-bookmarks
            ;;anything-c-source-locate))
            ))

(global-set-key "\C-xb" 'anything)
(global-set-key "\M-y" 'anything-show-kill-ring)
;;(global-set-key [?\C-;] 'iswitchb-buffer)
(anything-iswitchb-setup)

(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "M-v") 'anything-previous-source)
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))
