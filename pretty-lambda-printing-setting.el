(defun set-pretty-patterns (patterns)
  (loop for (glyph . pairs) in patterns do
	(loop for (regexp . major-modes) in pairs do
	      (loop for major-mode in major-modes do
		    (let ((major-mode (intern
				       (concat (symbol-name major-mode)
					       "-mode")))
			  (n (if (string-match "\\\\([^?]" regexp) 1 0)))
		      (font-lock-add-keywords
		       major-mode
		       `((,regexp (0 (prog1 ()
				       (compose-region (match-beginning ,n)
						       (match-end ,n)
						       ,glyph)))))))))))

(set-pretty-patterns
 '((?λ ("\\<lambda\\>" lisp lisp-interaction emacs-lisp scheme))))

