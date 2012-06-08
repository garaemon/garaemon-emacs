("http://garaemon.net/emacs-settings-repo/garaemon.el"
 (garaemon-all-settings
  virtual nil
  "this is a virtual package to build garaemon's emacs environment"
  (garaemon-mode-line-settings
   garaemon-builtin-keybinds
   garaemon-indent-settings
   garaemon-japanese-settings
   garaemon-gui-settings
   garaemon-built-in-major-mode-settings
   garaemon-built-in-minor-mode-settings
   garaemon-additional-major-mode-settings
   garaemon-joke-settings
   garaemon-built-in-misc-settings))
 
 ;; mode-line settings
 (garaemon-display-time-settings
  bootstrap
  http://garaemon.net/emacs-settings-repo/display-time-settings.el
  "settings for display-time. This package displays time in you mode-line."
  nil
  (:byte-compile))
 (garaemon-display-line-number-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/display-line-number-setting.el
  "display line number and column number in mode line"
  nil
  (:byte-compile))
 (garaemon-which-func-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/which-func-setting.el
  "which-func setting. which-func displays function name in you mode-line."
  nil
  (:byte-compile))
 (garaemon-mode-line-settings
  virtual nil
  "garaemon's mode line setting"
  (garaemon-display-line-number-setting
   garaemon-display-time-settings
   garaemon-which-func-setting))
 
 ;; builtin keybind
 (garaemon-backspace-keybind
  bootstrap
  http://garaemon.net/emacs-settings-repo/backspace-keybind.el
  "bind backward-delete-char to C-h. You can use help command by M-h."
  nil
  (:byte-compile))
 (garaemon-cocoa-emacs-meta-key-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/cocoa-emacs-meta-key-setting.el
  "use command key as a meta key in cocoa emacs."
  (garaemon-util)
  (:byte-compile))
 (garaemon-goto-line-keybind
  bootstrap
  http://garaemon.net/emacs-settings-repo/goto-line-keybind.el
  "bind goto-line to M-g"
  nil
  (:byte-compile))
 (garaemon-one-line-scroll
  bootstrap
  http://garaemon.net/emacs-settings-repo/one-line-scroll.el
  "gives one line scroll function and bind it to M-n and M-p."
  nil
  (:byte-compile))
 (garaemon-comment-in-out-keybind
  bootstrap
  http://garaemon.net/emacs-settings-repo/comment-in-out-keybind.el
  "bind comment-region to C-;, uncomment-region to C-:."
  nil
  (:byte-compile))
 (garaemon-dabbrev-keybind
  bootstrap
  http://garaemon.net/emacs-settings-repo/dabbrev-keybind.el
  "bind dabbrev-expand to C-o"
  nil
  (:byte-compile))
 (garaemon-hs-keybind
  bootstrap
  http://garaemon.net/emacs-settings-repo/hs-keybind.el
  "bind hs-{hide, show}-block to C-c{(, )} 
and hs-{hide, show}-all to C-c{{, }}"
  nil
  (:byte-compile))
 (garaemon-builtin-keybinds
  virtual nil
  "virtual package to setup keybinds"
  (garaemon-backspace-keybind
   garaemon-cocoa-emacs-meta-key-setting
   garaemon-goto-line-keybind
   garaemon-one-line-scroll
   garaemon-comment-in-out-keybind
   garaemon-dabbrev-keybind
   garaemon-hs-keybind))
 
 ;;for japanese
 (garaemon-japanese-setup
  bootstrap
  http://garaemon.net/emacs-settings-repo/japanese-setup.el
  "setup japanese environment. Default in UTF-8 encoding."
  nil
  (:byte-compile))
 (garaemon-japanese-ime-keybind
  bootstrap
  http://garaemon.net/emacs-settings-repo/japanese-ime-keybind.el
  "bind japanese ime toggling to C-\\"
  (garaemon-util)
  (:byte-compile))
 (garaemon-ddskk-ime-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/ddskk-ime-setting.el
  "ddskk setup. SKK is an ime for emacs. utilize aqua-skk in darwin."
  (ddskk garaemon-util)
  (:byte-compile))
 (garaemon-japanese-settings
  virtual nil
  "garaemon's japanese setting, including ime setup."
  (garaemon-japanese-ime-keybind
   garaemon-japanese-setup))
 
 ;; font setting
 (garaemon-meadow-font-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/meadow-font-setting.el
  "font setup for meadow, using arisaka font"
  nil
  (:byte-compile))
 (garaemon-carbon-emacs-font-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/carbon-emacs-font-setting.el
  "font setup for carbon emacs, using hiragino font for japanese characters."
  (garaemon-util)
  (:byte-compile))
 (garaemon-cocoa-emacs-font-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/cocoa-emacs-font-setting.el
  "font setup for cocoa emacs, using hiragino font for japanese characters."
  (garaemon-util)
  (:byte-compile))
 (garaemon-font-setting
  virtual nil 
  "This is a virtual package to setup font setting in cocoa emacs, 
carbon emacs and meadow."
  (garaemon-cocoa-emacs-font-setting garaemon-carbon-emacs-font-setting
                                     garaemon-meadow-font-setting))
 
 ;; built-in misc...
 (garaemon-built-in-misc-settings
  virtual nil
  "misc setting for built-in function"
  (garaemon-configurated-meadow-settings
   garaemon-meadow-no-mouse-setting
   garaemon-startup-message-setup
   garaemon-no-backup-file-setting
   garaemon-y-or-n-p-setting
   garaemon-emphasize-region-setting
   garaemon-no-bars-setting
   garaemon-indent-on-newline-setting
   garaemon-ignore-case-in-completion-setting
   garaemon-no-audio-bell-setting
   garaemon-show-paren-setting
   garaemon-truncate-lines-setting
   garaemon-imenu-setting
   garaemon-iswitch-setting
   garaemon-uniquify-setting
   garaemon-ispell-ignore-japanese-setting
   garaemon-cuda-file-setting
   garaemon-cg-file-setting
   garaemon-tramp-setting))
 (garaemon-configurated-meadow-settings
  bootstrap
  http://garaemon.net/emacs-settings-repo/configurated-meadow-settings.el
  "settings for configurated meadow"
  (garaemon-util)
  (:byte-compile))
 (garaemon-meadow-no-mouse-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/meadow-no-mouse-setting.el
  "hide mouse cursor on meadow."
  (garaemon-util)
  (:byte-compile))
 (garaemon-startup-message-setup
  bootstrap
  http://garaemon.net/emacs-settings-repo/startup-message-setup.el
  "disable showing startup message."
  nil
  (:byte-compile))
 (garaemon-no-backup-file-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/no-backup-file-setting.el
  "does not create foovar~ files."
  nil
  (:byte-compile))
 (garaemon-y-or-n-p-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/y-or-n-p-setting.el
  "replace yes-or-no-p by y-or-n-p."
  nil
  (:byte-compile))
 (garaemon-emphasize-region-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/emphasize-region-setting.el
  "emphasize the region you selected by truncate"
  nil
  (:byte-compile))
 (garaemon-no-bars-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/no-bars-setting.el
  "remove scroll bar, menu bar and tool bar"
  (garaemon-util)
  (:byte-compile))
 (garaemon-indent-on-newline-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/indent-on-newline-setting.el
  "always indent when you hit enter key."
  nil
  (:byte-compile))
 (garaemon-ignore-case-in-completion-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/ignore-case-in-completion-setting.el
  "ignore the case of characters when completion"
  nil
  (:byte-compile))
 (garaemon-no-audio-bell-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/no-audio-bell-setting.el
  "disable audio bell and enbale visible bell."
  nil
  (:byte-compile))
 (garaemon-show-paren-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/show-paren-setting.el
  "emphasize matched parens."
  nil
  (:byte-compile))
 (garaemon-save-window-size-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/save-window-size-setting.el
  "save window size when closing emacs, and bootstrap in the last window sizeo"
  nil
  (:byte-compile))
 (garaemon-truncate-lines-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/truncate-lines-setting.el
  "truncate the lines which are too long to be displayed."
  nil
  (:byte-compile))
 (garaemon-pretty-lambda-printing-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/pretty-lambda-printing-setting.el
  "replace lambda by 'lambda' character."
  nil
  (:byte-compile))
 (garaemon-imenu-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/imenu-setting.el
  "imenu setup"
  nil
  (:byte-compile))
 (garaemon-iswitch-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/iswitch-setting.el
  "iswitcth setting"
  nil
  (:byte-compile))
 (garaemon-uniquify-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/uniquify-setting.el
  "use the parent directory name for the buffers which has the same name"
  nil
  (:byte-compile))
 (garaemon-ibuffer-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/ibuffer-setting.el
  "use ibuffer when switching buffers by C-x C-b"
  nil
  (:byte-compile))
 (garaemon-ispell-ignore-japanese-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/ispell-ignore-japanese-setting.el
  "ispell"
  nil
  (:byte-compile))
 (garaemon-cuda-file-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/cuda-file-setting.el
  "use c-mode for .cu file"
  nil
  (:byte-compile))
 (garaemon-cg-file-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/cg-file-setting.el
  "use c-mode for .cg file"
  nil
  (:byte-compile))
 (garaemon-tramp-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/tramp-setting.el
  "require tramp, and use sshx for darwin?."
  nil
  (:byte-compile))

 ;; indent
 (garaemon-indent-settings
  virtual nil
  "indent settings by garaemon."
  (garaemon-indent-style garaemon-soft-tab-setting))
 (garaemon-soft-tab-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/soft-tab-setting.el
  "no hard tab, use soft tab in all major modes"
  nil
  (:byte-compile))
 (garaemon-indent-style
  bootstrap
  http://garaemon.net/emacs-settings-repo/indent-style.el
  "set C indent style to `stroustrup' style."
  nil
  (:byte-compile))

 ;; for gui
 (garaemon-gui-settings
  virtual nil
  "virtual package to give garaemon's gui settings."
  (garaemon-thumbs-setting 
   garaemon-gui-color-setting
   garaemon-show-image-setting
   garaemon-font-setting
   garaemon-column-marker-setting))
 (garaemon-show-image-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/show-image-setting.el
  "display image in GUI emacs"
  nil
  (:byte-compile))
 (garaemon-gui-color-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/gui-color-setting.el
  "GUI color setup"
  (garaemon-util)
  (:byte-compile))
 (garaemon-thumbs-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/thumbs-setting.el
  "use ~/.emacs-thumbs as a cache directory and /tmp as a working directory"
  nil
  (:byte-compile))
 (garaemon-column-marker-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/column-marker-setting.el
  "enable column-marker at the 80th columns"
  (column-marker)
  (:byte-compile))
 ;; built-in major mode
 (garaemon-built-in-major-mode-settings
  virtual nil
  "virtual package for settings for built-in minor-mode"
  (garaemon-shell-mode-setting
   garaemon-markdown-setting
   garaemon-eshell-mode-setting
   ;;garaemon-python-mode-setting
   garaemon-lisp-indent-setting
   garaemon-lisp-font-lock-setting
   garaemon-html-mode-setting
   garaemon-scheme-mode-for-gauche-setting
   garaemon-nxml-mode-setting))
 (garaemon-shell-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/shell-mode-setting.el
  "misc for shell-mode"
  (garaemon-util)
  (:byte-compile))
 (garaemon-eshell-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/eshell-mode-setting.el
  "misc for eshell-mode"
  nil
  (:byte-compile))
 (garaemon-python-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/python-mode-setting.el
  "misc for python-mode"
  (ipython python-mode-extension)
  (:byte-compile))
 (garaemon-lisp-indent-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/lisp-indent-setting.el
  "setup common lisp indent"
  nil
  (:byte-compile))
 (garaemon-lisp-font-lock-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/lisp-font-lock-setting.el
  "add some font lock to lisp-mode"
  nil
  (:byte-compile))
 (garaemon-html-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/html-mode-setting.el
  "use html-mode when editing *.html file"
  nil
  (:byte-compile))
 (garaemon-scheme-mode-for-gauche-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/scheme-mode-for-gauche-setting.el
  "scheme mode setup specialized for gauche."
  nil
  (:byte-compile))
 (garaemon-nxml-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/nxml-mode-setting.el
  "use nxml-mode in editing xml"
  nil
  (:byte-compile))

 ;; built-in minor-mode
 (garaemon-built-in-minor-mode-settings
  virtual nil
  "virtual package for settings for built-in minor-mode"
  (garaemon-flyspell-mode-setting))
 (garaemon-flyspell-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/flyspell-mode-setting.el
  "enable flyspell-mode in tex-mode"
  nil
  (:byte-compile))

 ;; additional major modes
 (garaemon-additional-major-mode-settings
  virtual nil
  "virtual package for settings for additional major mode"
  (garaemon-euslisp-mode-setting
   garaemon-haskell-mode-setting
   ;;garaemon-migemo-setting ;; does not work now
   garaemon-navi-2ch-setting   
   garaemon-anything-setting
   garaemon-anything-grep-setting
   garaemon-cygwin-mount-setting
   garaemon-anthy-ime-setting
   garaemon-goby-mode-setting
   garaemon-slime-mode-setting
   garaemon-twittering-mode-setting
   garaemon-go-lang-mode-setting
   garaemon-yatex-mode-setting
   garaemon-magit-setting
   garaemon-auto-complete-setting
   garaemon-emacs-wiki-setting
   garaemon-muse-setting
   garaemon-mode-info-mode-setting
   garaemon-sdic-setting
   garaemon-org-mode-setting
   garaemon-org-blog-setting
   garaemon-wanderlust-setting
   garaemon-bm-setting
   garaemon-dsvn-setting))
 (euslisp
  library
  http://garaemon.net/emacs-settings-repo/euslisp-mode.el
  "euslisp editting mode. originaly written by T.Ogura."
  nil
  (:byte-compile))
 (garaemon-euslisp-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/euslisp-mode-setting.el
  "misc for euslisp mode"
  (euslisp)
  (:byte-compile))
 (garaemon-haskell-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/haskell-mode-setting.el
  "misc for haskell mode"
  (haskell)
  (:byte-compile))
 (garaemon-migemo-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/migemo-setting.el
  "settings for using migemo. you need to install migemo."
  (garaemon-util)
  (:byte-compile))
 (garaemon-navi-2ch-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/navi-2ch-setting.el
  "settings for navi-2ch. you can use navi-2ch out of box by this package."
  (navi-2ch)
  (:byte-compile))
 (garaemon-anything-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/anything-setting.el
  "anything settings by garaemon"
  (anything jsk-rosemacs)
  (:byte-compile))
 (garaemon-anything-grep-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/anything-grep-setting.el
  "anything-grep settings by garaemon,
copied from http://d.hatena.ne.jp/rubikitch/20090106/anythinggrep"
  (anything)
  (:byte-compile))
 (garaemon-cygwin-mount-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/cygwin-mount-setting.el
  "use cygin-mount when using cygwin emacs"
  nil
  (:byte-compile))
 (garaemon-anthy-ime-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/anthy-ime-setting.el
  "use anthy.el for ime in cygwin and linux. You need to install anthy."
  nil
  (:byte-compile))
 (garaemon-goby-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/goby-mode-setting.el
  "set autoload for goby"
  (goby)
  (:byte-compile))
 (garaemon-slime-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/slime-mode-setting.el
  "slime setting used by garaemon"
  (ac-slime)
  (:byte-compile))
 (garaemon-twittering-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/twittering-mode-setting.el
  "twittering mode setting. You need write you passward in ~/.twittering."
  (twittering)
  (:byte-compile))
 (garaemon-go-lang-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/go-lang-mode-setting.el
  "Google Go Language Settings"
  ;;(golang))
  nil
  (:byte-compile)
  )
 (garaemon-yatex-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/yatex-mode-setting.el
  "yatex mode setup"
  (yatex)
  (:byte-compile))
 (garaemon-shell-pop-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/shell-pop-setting.el
  "shell pop setting"
  (shell-pop)
  (:byte-compile))
 (garaemon-magit-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/magit-setting.el
  "magit is a git interface to emacs. to use git, add /opt/local/bin
in darwin."
  (magit)
  (:byte-compile))
 (garaemon-auto-complete-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/auto-complete-setting.el
  "setting to use auto-complete"
  (auto-complete)
  (:byte-compile))
 (garaemon-emacs-wiki-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/emacs-wiki-setting.el
  "settings to use emacs-wiki mode"
  (emacs-wiki garaemon-util)
  (:byte-compile))
 (garaemon-muse-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/muse-setting.el
  "settings to use muse mode"
  (muse)
  (:byte-compile))
 (garaemon-mode-info-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/mode-info-mode-setting.el
  "mode-info-mode settings"
  (mode-info)
  (:byte-compile))
 (garaemon-sdic-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/sdic-setting.el
  "sdic. http://www.namazu.org/~tsuchiya/sdic/"
  ;; (sdic) ;; currently not supported
  nil
  (:byte-compile))
 (garaemon-org-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/org-mode-setting.el
  "org-mode setting."
  (org)
  (:byte-compile))
 (garaemon-wanderlust-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/wanderlust-setting.el
  "use ~/.wl file as a your wanderlust setting file. You need to install
wanderlust by hand currently."
  ;; (wanderlust) no support
  nil
  (:byte-compile))
 
 ;; joke
 (garaemon-joke-settings
  virtual nil
  "virtual package for settings for joke libraries"
  (garaemon-zone-setting
   garaemon-google-code-lookup))
 (garaemon-zone-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/zone-setting.el
  "enable zone as a screen saver."
  nil
  (:byte-compile))
 (garaemon-google-code-lookup
  bootstrap
  http://garaemon.net/emacs-settings-repo/google-code-lookup.el
  "written by g1. look up word from google code. bind to C-cs"
  nil
  (:byte-compile))
 (garaemon-sudo-open
  bootstrap
  http://garaemon.net/emacs-settings-repo/sudo-open.el
  "If you visit the file whose owner is root, this script re-visit it
using sudo command.
This is copied from http://ubulog.blogspot.com/2010/03/emacs-sudo.html"
  nil
  (:byte-compile))
 (garaemon-util
  library
  http://garaemon.net/emacs-settings-repo/garaemon-util.el
  "utility for compatility between some emacs version and os"
  nil
  (:byte-compile))
 (anything-cheat-sheat-popup
  library
  http://garaemon.net/emacs-settings-repo/anything-cheat-sheat-popup.el
  "cheat-sheat"
  (anything auto-complete)
  (:byte-compile))
 (garaemon-anything-cheat-sheat-popup-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/anything-cheat-sheat-popup-setting.el
  "cheat-sheat setting using org mode."
  (anything auto-complete org-mode)
  (:byte-compile))
 (garaemon-org-blog-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/org-blog-setting.el
  "garaemon org-blog setting"
  (org-blog)
  (:byte-compile))
 (org-blog
  library
  (git git@github.com:garaemon/org-blog.git)
  "write a blog on org-mode"
  (org)
  (:byte-compile))
 (garaemon-bm-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/bm-setting.el
  "garaemon bm setting"
  (bm)
  (:byte-compile))
 (garaemon-dsvn-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/dsvn-setting.el
  "garaemon dsvn setting"
  (svn-clients-patched)
  (:byte-compile))
 (garaemon-markdown-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/markdown-mode-setting.el
  "garaemon markdown-mode setting"
  (markdown)
  (:byte-compile))
 (garaemon-js2-mode-setting
  bootstrap
  http://garaemon.net/emacs-settings-repo/garaemon-js2-mode-setting.el
  "garaemon js2-mode setting"
  (js2-mode)
  (:byte-compile))
 )