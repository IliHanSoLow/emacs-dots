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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company dashboard dracula-theme eat evil-collection expand-region
			 gdscript-mode general go-mode gruber-darker-theme
			 guess-language ido-completing-read+ imenu-anywhere ivy
			 magit nerd-icons nix-mode org-bullets org-download smex
			 typst-ts-mode undo-fu undo-tree undohist yaml-pro
			 yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
