(require 'org-blog)
(require 'anything-org-blog)

(global-set-key "\M-o" 'anything-org-blog)

(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)
(setq org-blog-max-article-num 5)
(setq org-blog-max-recent-article-num 15)
(setq org-blog-root-dir "~/Dropbox/org/garaemon.net")
(setq org-blog-output-root-dir "~/Dropbox/org/garaemon.net-output")
(setq org-blog-menu-file "menu.org")
(setq org-blog-title "garaemon.net: 脳汁でコードを書く")
(setq org-blog-url "http://garaemon.net/org")
(setq org-blog-rss-description "generated by org-blog")
(setq org-blog-rss-file "rss.rdf")
(setq org-blog-file-suffix "org")
(setq org-blog-update-command "~/Dropbox/org/garaemon.net/update.sh")
(setq org-blog-styles
      '("<link rel=\"stylesheet\" type=\"text/css\" href=\"worg.css\" />"))
