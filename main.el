;; --- GENERAL SETUP ---
(setq inhibit-startup-screen t)
(set-frame-font "Victor Mono 16")
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(setq-default tab-width 4)
(require 'recentf)
(recentf-mode 1)

;;enable ido mode
(require 'ido)
(ido-mode t)
(ido-everywhere t)
