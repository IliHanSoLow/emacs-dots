(elpaca elpaca-use-package (elpaca-use-package-mode))
(elpaca-wait)

;; --- PACKAGES ---
;; smex
(use-package smex :ensure t
  :config (smex-initialize) :bind ("M-x" . smex))
(use-package ido-completing-read+ :ensure t
  :config (ido-ubiquitous-mode t))

;; gruber-darker
(use-package gruber-darker-theme
  :ensure t :config (load-theme 'gruber-darker t))

;; yasnippet
(use-package yasnippet :ensure t :config (yas-global-mode 1))
(use-package yasnippet-snippets :ensure t)

;; dashboard
(use-package nerd-icons :ensure t)
(use-package dashboard :ensure t
  :config  (dashboard-setup-startup-hook)
           (setq dashboard-items '((recents . 5)
                                   (bookmarks . 5)
                                   (agenda . 5)))
           (setq dashboard-display-icons-p t)
           (setq dashboard-icon-type 'nerd-icons)
           (setq dashboard-set-file-icons t))


;; company-mode
(use-package company :ensure t :config (global-company-mode))

;; undo-hist
(use-package undohist :ensure t :config (undohist-initialize))
(use-package undo-fu :ensure t)

;; magit
(use-package transient :ensure t)
(use-package magit :ensure t :config
  (setq magit-completing-read-function 'magit-ido-completing-read))

;; which-key
(use-package which-key :ensure t :config (which-key-mode))

;; go-mode
(elpaca go-mode :source "ELPA")

;; typst
(use-package typst-ts-mode
  :ensure (:type git :host sourcehut :repo "meow_king/typst-ts-mode")
  :custom
  (typst-ts-mode-watch-options "--open"))

;; EVIL 👿
(elpaca evil :config t (evil-mode 0)) ;; change to 1 if autostart

;; org
(elpaca org-bullets :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(elpaca org-download :config (add-hook 'dired-mode-hook 'org-download-enable))

;; godot
(use-package gdscript-mode
    :ensure (gdscript-mode
               :type git
               :host github
               :repo "godotengine/emacs-gdscript-mode"))

;; eglot
(use-package eldoc :ensure t :after elpaca)
(use-package jsonrpc :ensure t :after eldoc)
(use-package eglot :ensure t :after eldoc)

;; nix
(use-package nix-mode :ensure t :mode "\\.nix\\'")

;; yaml
;; (use-package yaml-mode
  ;; :ensure t
  ;; :mode "\\.ya?ml\\'"
  ;; :hook (yaml-mode . (lambda ()
                       ;; (define-key yaml-mode-map "\C-m" 'newline-and-indent))))
(use-package yaml-pro :ensure t :config (add-hook 'yaml-ts-mode-hook #'yaml-pro-ts-mode 100))
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-ts-mode))


;; Miscellaneous
(use-package emacs :ensure nil :config (setq ring-bell-function #'ignore))
