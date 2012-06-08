(require 'muse-mode)
(require 'muse-html)
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-docbook)
(require 'muse-book)
(require 'muse-wiki)
(require 'muse-project)
(add-to-list 'muse-project-alist
             '("Default"
               ("~/muse/default" :default "index")
               (:base "html" :path "~/muse/default/html")))
(add-to-list 'muse-ignored-extensions "DS_store")
(defvar *muse-root* (expand-file-name "~/muse/default"))
