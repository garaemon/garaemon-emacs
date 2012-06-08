(require 'anything-grep)
(setq anything-grep-alist
      ;; 全バッファのファイル名においてegrepをかける。moccurの代わり。
      '(("buffers" ("egrep -Hin %s $buffers" "/"))
	;; ~/memo 以下から再帰的にegrepをかける。不要なファイルは除かれる。
	("memo" ("ack-grep -af | xargs egrep -Hin %s" "~/memo"))
	;; ~/doc/postgresql-74 から *.txt に対してegrepをかける。
	("PostgreSQL" ("egrep -Hin %s *.txt" "~/doc/postgresql-74/"))
	;; ~/prog以下のファイルをまとめて検索する。
	("~/prog"
	 ("ack-grep -af | xargs egrep -Hin %s" "~/prog"))
	))
;;
(global-set-key "\C-c;" 'anything-grep)
(global-set-key "\C-c:" 'anything-grep-by-name)
