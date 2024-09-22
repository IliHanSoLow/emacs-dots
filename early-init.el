;;add load dir to load-path
(cond
 ((eq system-type 'windows-nt)
  (add-to-list 'load-path "~/AppData/Roaming/emacs/load/"))
 ((eq system-type 'gnu/linux)
  (add-to-list 'load-path "~/.config/emacs/load/")))

(setq package-enable-at-startup nil)

