(when (eq window-system 'windows-nt)
  (require 'cygwin-mount-mw32)
  (cygwin-mount-activate))
