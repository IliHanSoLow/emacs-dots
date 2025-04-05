(load "packages")
(load "eglot-config")

(cond
 ((eq system-type 'windows-nt)
  (load "~/.emacs.d/main.el")
  (setq conf-dir "~/.emacs.d/")
  )
 ((eq system-type 'gnu/linux)
  (load "~/.config/emacs/main.el" )
  (setq conf-dir "~/.config/emacs/")
  ))

(load "evil-config")
