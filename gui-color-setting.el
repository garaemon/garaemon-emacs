(require 'garaemon-util)

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
