(load "install-elpaca")
(load "packages")

(cond
 ((eq system-type 'windows-nt)
  (load "~/.emacs.d/main.el")
  (setq conf-dir "~/.emacs.d/")
  )
 ((eq system-type 'gnu/linux)
  (load "~/.config/emacs/main.el" )
  (setq conf-dir "~/.config/emacs/")
  ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(smex gruber-darker-theme))
 '(warning-suppress-types '((comp) (emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
