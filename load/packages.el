(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
kj ksj    ksj fsk f
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (require 'use-package-ensure)
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; --- PACKAGES ---
;; smex
; (use-package smex
  ; :config (smex-initialize) :bind ("M-x" . smex))
; (use-package ido-completing-read+
  ; :config (ido-ubiquitous-mode t))

;; ivy
(use-package ivy :config (ivy-mode t))

;; THEME
; (use-package gruber-darker-theme
  ; :config (load-theme 'gruber-darker t))
(use-package dracula-theme :config (load-theme 'dracula t))

;; yasnippet
(use-package yasnippet :config (yas-global-mode 1))
(use-package yasnippet-snippets )

;; dashboard
(use-package nerd-icons )

(use-package dashboard
  :config  (dashboard-setup-startup-hook)
  (setq dashboard-projects-backend 'project-el)
  (setq dashboard-items '((recents   . 5)
						  (projects  . 5)
                          (bookmarks . 5)
                          (agenda    . 5)))
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-file-icons t))


;; company-mode
(use-package company :config (global-company-mode))

;; undo-hist
;; (use-package undohist :config (undohist-initialize))
;; (use-package undo-fu )

;; undo-tree
(use-package undo-tree :config
                        (global-undo-tree-mode)
						(setq undo-tree-auto-save-history t)
                        (setq undo-tree-history-directory-alist '(("." . "~/.local/share/emacs/undo"))))

;; magit
(use-package transient )
(use-package magit :config
  (setq magit-completing-read-function 'magit-ido-completing-read)
  (global-set-key (kbd "C-c C-c") 'magit-status))

;; which-key
; (use-package which-key :config (which-key-mode))

;; go-mode
(use-package go-mode)

;; typst
(use-package typst-ts-mode
  :vc (:url "https://codeberg.org/meow_king/typst-ts-mode" :rev main)
  :custom
  (typst-ts-mode-watch-options "--open"))

;; EVIL 👿
; (use-package evil :config (evil-mode t) :demand t) ;; change to 1 if autostart
(use-package evil-collection  :init (setq evil-want-keybinding nil)
                                    (evil-mode t)
                                    (evil-collection-init)
                              :demand t)


;; org
(use-package org-bullets :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package org-download :config (add-hook 'dired-mode-hook 'org-download-enable))

;; godot
(use-package gdscript-mode)

;; eglot
(use-package eldoc)
(use-package jsonrpc)
(use-package eglot)

;; nix
(use-package nix-mode :mode "\\.nix\\'")

;; yaml
; (use-package yaml-mode
  ; :mode "\\.ya?ml\\'"
  ; :hook (yaml-mode . (lambda ()
                       ; (define-key yaml-mode-map "\C-m" 'newline-and-indent))))
(use-package yaml-pro :config (add-hook 'yaml-ts-mode-hook #'yaml-pro-ts-mode 100))
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-ts-mode))

;; expand-region
(use-package expand-region :config (global-set-key (kbd "C-;") 'er/expand-region))

(use-package guess-language :config
  (setq guess-language-langcodes '((en . ("en_GB" "English"))
								   (de . ("de_DE", "German"))))
  (setq guess-language-min-paragraph-length 35))

;; eat
(use-package eat
  :config
  (global-set-key (kbd "C-c t") 'eat-project-other-window))

;; imenu-anywhere
(use-package imenu-anywhere)


;; Miscellaneous
(use-package emacs :ensure nil :config (setq ring-bell-function #'ignore))
