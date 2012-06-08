(when-meadow
 (let ((make-spec
	(function
	 (lambda (size charset fontname &optional windows-charset)
	   (setq size (- size))
	   (if (not windows-charset)
	       (setq windows-charset
		     (cadr (assq charset
				 mw32-charset-windows-font-info-alist))))
	   `(((:char-spec ,charset :height any)
	      strict
	      (w32-logfont ,fontname 0 ,size 400 0
			   nil nil nil ,windows-charset 1 3 0))
	     ((:char-spec ,charset :height any :weight bold)
	      strict
	      (w32-logfont ,fontname 0 ,size 700 0
			   nil nil nil ,windows-charset 1 3 0)
	      ((spacing . -1)))
	     ((:char-spec ,charset :height any :slant italic)
	      strict
	      (w32-logfont ,fontname 0 ,size 400 0
			   t nil nil ,windows-charset 1 3 0))
	     ((:char-spec ,charset :height any :weight bold :slant italic)
	      strict
	      (w32-logfont ,fontname 0 ,size 700 0
			   t nil nil ,windows-charset 1 3 0)
	      ((spacing . -1)))))))
       (make-spec-list
	(function
	 (lambda (size params-list)
           (list
	    (cons 'spec
		  (apply 'append
			 (mapcar (lambda (params)
				   (apply make-spec (cons size params)))
				 params-list)))))))
       (define-fontset
	 (function
	  (lambda (fontname size fontset-list)
	    (let ((spec (funcall make-spec-list size fontset-list)))
	      (if (w32-list-fonts fontname)
		  (w32-change-font fontname spec)
		(w32-add-font fontname spec))))))
       (arisaka-fontset-list
	'((ascii "monaco")
	  (katakana-jisx0201 "ARISAKA-等幅")
	  (japanese-jisx0208 "ARISAKA-等幅")))
       )
   (funcall define-fontset "Arisaka 10" 10 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 12" 12 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 14" 14 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 16" 16 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 18" 18 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 20" 20 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 22" 22 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 24" 24 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 36" 36 arisaka-fontset-list)
   (funcall define-fontset "Arisaka 48" 48 arisaka-fontset-list)
   )
 ;; 初期フレームの設定
 (setq default-frame-alist
       (append (list '(font . "Arisaka 12")
		     '(ime-font . (w32-logfont "Arisaka"
					       0 16 400 0 nil nil nil
					       128 1 3 49))) ; TrueType のみ
	       default-frame-alist))
 )
