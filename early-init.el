;;add load dir to load-path
(setq package-enable-at-startup nil)
(set-locale-environment "en_US.UTF-8")
(cond
 ((eq system-type 'windows-nt)
  (let* ((home (getenv "HOME"))
         (config-dir (if home
						 (expand-file-name ".config/emacs/load" home)
					   ("~/.emacs.d/load" ))))
    (add-to-list 'load-path config-dir)))
 ((eq system-type 'gnu/linux)
  (add-to-list 'load-path "~/.config/emacs/load/")))
