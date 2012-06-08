(defun my-window-size-save ()
  (let* ((rlist (frame-parameters (selected-frame)))
	 (ilist initial-frame-alist)
	 (nCHeight (frame-height))
	 (nCWidth (frame-width))
	 (tMargin (if (integerp (cdr (assoc 'top rlist)))
		      (cdr (assoc 'top rlist)) 0))
	 (lMargin (if (integerp (cdr (assoc 'left rlist)))
		      (cdr (assoc 'left rlist)) 0))
	 buf
	 (file "~/.framesize.el"))
    (if (get-file-buffer (expand-file-name file))
	(setq buf (get-file-buffer (expand-file-name file)))
      (setq buf (find-file-noselect file)))
    (set-buffer buf)
    (erase-buffer)
    (insert (concat
	     "(delete 'width initial-frame-alist)\n"
	     "(delete 'height initial-frame-alist)\n"
	     "(delete 'top initial-frame-alist)\n"
	     "(delete 'left initial-frame-alist)\n"
	     "(setq initial-frame-alist (append (list\n"
	     "'(width . " (int-to-string nCWidth) ")\n"
	     "'(height . " (int-to-string nCHeight) ")\n"
	     "'(top . " (int-to-string tMargin) ")\n"
	     "'(left . " (int-to-string lMargin) "))\n"
	     "initial-frame-alist))\n"
	     ))
    (save-buffer)
    ))

(defun my-window-size-load ()
  (let* ((file "~/.framesize.el"))
    (if (file-exists-p file)
	(load file))))

(my-window-size-load)

;; Call the function above at C-x C-c.
(defadvice save-buffers-kill-emacs
  (before save-frame-size activate)
  (my-window-size-save))
