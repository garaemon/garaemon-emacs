(defun cl-indent (sym indent)
  (put sym 'common-lisp-indent-function
       (if (symbolp indent)
	   (get indent 'common-lisp-indent-function)
	 indent)))

(cl-indent 'iterate 'let)
(cl-indent 'collect 'progn)
(cl-indent 'mapping 'let)
(cl-indent 'mapping 'let)
(cl-indent 'define-test 'let)
