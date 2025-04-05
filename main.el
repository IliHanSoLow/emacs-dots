;; --- GENERAL SETUP ---
(setq inhibit-startup-screen t)
(set-frame-font "Victor Mono 16" t t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)

(column-number-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(electric-pair-mode t)
(defalias 'yes-or-no-p #'y-or-n-p)

(setq backup-directory-alist '(("" . "~/.backup/"))
      backup-by-copying t
      version-control t
      delete-old-versions t)

(add-hook 'server-after-make-frame-hook
		  (lambda ()
			(set-frame-font "Victor Mono 16" t t)
			(tool-bar-mode 0)
			(menu-bar-mode 0)
			(scroll-bar-mode 0)))

(setq-default tab-width 4)
(require 'recentf)
(recentf-mode 1)
(ffap-bindings)

(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))

;;start maximized
;;  (cond
;;  ((eq system-type 'windows-nt)
;;   (add-to-list 'default-frame-alist '(fullscreen . maximized))
;;   ))

;; enable ido mode
; (require 'ido)
; (ido-mode t)
; (ido-everywhere t)

;; dired
(require 'dired-x)
(setq dired-omit-files
	  (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")

;; keybinds
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)
(global-set-key (kbd "C-c C-k") 'kill-current-buffer)

;; store backups in specific dir
(setq auto-save-file-name-transforms
  `((".*" "~/.local/share/emacs/auto-saves" t)))


(setq backup-directory-alist `(("." . "~/.local/share/emacs/backups/")))

;; exclude files from recentf
(add-to-list 'recentf-exclude "\\.windows\\'")
(add-to-list 'recentf-exclude "\\.revive\\'")
(add-to-list 'recentf-exclude "\\ido.last\\'")

;; hunspell
(setq ispell-program-name "hunspell")

;; treesitter lang sources
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
