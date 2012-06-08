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

