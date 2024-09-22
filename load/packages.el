;; Install use-package support
(elpaca elpaca-use-package (elpaca-use-package-mode))
(elpaca-wait)

;; --- PACKAGES ---
;;smex
(use-package smex :ensure t
  :config (smex-initialize) :bind ("M-x" . smex))
(use-package ido-completing-read+ :ensure t
  :config (ido-ubiquitous-mode t))

;;gruber-darker
(use-package gruber-darker-theme
  :ensure t :config (load-theme 'gruber-darker t))

;;yasnippet
(use-package yasnippet :ensure t :config (yas-global-mode 1))
(use-package yasnippet-snippets :ensure t)

;;dashboard
(use-package nerd-icons :ensure t)
(use-package dashboard :ensure t
  :config  (dashboard-setup-startup-hook)
		   (setq dashboard-items '((recents . 5)
								   (bookmarks . 5)
								   (agenda . 5)))
		   (setq dashboard-display-icons-p t)
		   (setq dashboard-icon-type 'nerd-icons)
		   (setq dashboard-set-file-icons t))

;;eglot
(use-package eldoc :ensure t)
(use-package jsonrpc :ensure t)
(use-package eglot :ensure t)

;;company-mode
(use-package company :ensure t :config (global-company-mode))

;;undo-hist
(use-package undohist :ensure t :config (undohist-initialize))
(use-package vundo :ensure t)

;;magit
(use-package transient :ensure t)
(use-package magit :ensure t :config
  (setq magit-completing-read-function 'magit-ido-completing-read))

;; which-key
(use-package which-key :ensure t :config (which-key-mode))


;; --- IDK WHATS HERE ---
;;Useful for configuring built-in emacs features.
(use-package emacs :ensure nil :config (setq ring-bell-function #'ignore))
