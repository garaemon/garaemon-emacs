(autoload 'clmemo "clmemo" "ChangeLog memo mode." t)
;; あなたの ChangeLog メモファイルへのパス
(setq clmemo-file-name "~/Documents/changelog/ChangeLog")
;; 好きなキーへバインド
(global-set-key "\C-xM" 'clmemo)
;; タイトルの補完
(setq clmemo-title-list '("idea" "bookmark" "Emacs" "EusLisp" "Research"))
