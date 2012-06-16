;; anything-cheat-sheat-popup.el
;; written by R.Ueda (garaemon)
(require 'outline)
(defvar anything-c-cheat-sheat-sources nil)
(defvar anything-cheat-sheat-popup-debug t)
(defvar anything-cheat-header-regexp outline-regexp)

(defun cheat-sheat-get-string-until-newline ()
  (interactive)
  (let ((current-position (point)))
    (forward-line)
    (let ((end-position (point)))
      (buffer-substring current-position end-position))))


(defun cheat-sheat-source-init-function ()
  (with-current-buffer
      (anything-candidate-buffer 'global)
    (let ((str
           (with-current-buffer (find-file-noselect cheat-sheat-file-name)
             (if anything-cheat-sheat-popup-debug
                 (message "file -> %s" cheat-sheat-file-name))
             (goto-char (point-min)) ;initialize
             (let ((ret nil))
               (while (re-search-forward
                       (concat "^" anything-cheat-header-regexp) nil t)
                 (goto-char (match-beginning 0))
                 (push (cheat-sheat-get-string-until-newline) ret))
               (apply #'concatenate 'string (reverse ret))))))
          (insert str))))

(defun cheat-sheat-add-source (alist)
  ;; dupulication check
  (if (find (cdr (assoc 'name alist)) anything-c-cheat-sheat-sources
            :test #'string=
            :key #'(lambda (x) (cdr (assoc 'name x))))
      (setq anything-c-cheat-sheat-sources
            (remove-if
             #'(lambda (x)
                 (string= (cdr (assoc 'name alist))
                          (cdr (assoc 'name x))))
             anything-c-cheat-sheat-sources)))
  ;; add
  (push alist anything-c-cheat-sheat-sources))

(defun cheat-sheat-pop-up (content)
  (let ((cheat-sheat
         (cdr (assoc 'file-name
                     (find-cheat-sheat-source-for-current-mode)))))
    (if anything-cheat-sheat-popup-debug
        (message "cheat-sheat => %s" cheat-sheat))
    (popup-tip
     (with-current-buffer (find-file-noselect cheat-sheat)
       (goto-char (point-min))
       (search-forward content nil t)   ;goto the selected outline
       (goto-char (match-beginning 0))
       (forward-line 1)
       (let ((current-pos (point)))
         (re-search-forward
          (concat "^" anything-cheat-header-regexp) nil t)
         (goto-char (match-beginning 0))
         (let ((end-pos (point)))
           (let ((tmp (buffer-substring current-pos end-pos)))
             (if anything-cheat-sheat-popup-debug
                 (message "=> %s" tmp))
             tmp)))))))

(defmacro defanything-cheat-sheat (name modes fname)
  (let ((alist (gensym)))
    `(let ((,alist
            `((name . ,',(format "cheat sheat for %s" name))
              (candidates-in-buffer)
              (init . (lambda ()
                        (let ((cheat-sheat-file-name ,',fname))
                          (cheat-sheat-source-init-function))))
              (action . cheat-sheat-pop-up)
              (file-name . ,',fname)
              (modes . ,',modes))))
       (cheat-sheat-add-source ,alist)
       ,alist)))

(defun find-cheat-sheat-source-for-current-mode ()
  (find major-mode anything-c-cheat-sheat-sources
        :key #'(lambda (x) (assoc 'modes x))
        :test #'member))

(defun anything-cheat-sheat ()
  (interactive)
  (let ((s (find-cheat-sheat-source-for-current-mode)))
    (anything (list s))))

(provide 'anything-cheat-sheat-popup)

