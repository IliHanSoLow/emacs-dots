;;add load dir to load-path
(setq package-enable-at-startup nil)
(set-locale-environment "en_US.UTF-8")
(cond
 ((eq system-type 'windows-nt)
  (add-to-list 'load-path "~/.emacs.d/load/"))
 ((eq system-type 'gnu/linux)
  (add-to-list 'load-path "~/.config/emacs/load/")))
