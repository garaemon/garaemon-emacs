(defun gcode-lookup ()
  "カーソル位置のシンボルをGoogle Codeで検索(lisp決め打ち)"
  (interactive)
  (browse-url
   (format
    "http://www.google.com/codesearch?q=%s+lang:%s+file:\\.%s$&hl=ja&num=20"
    (thing-at-point 'symbol) "lisp" "lisp")))
(global-set-key "\C-cs" 'gcode-lookup)
