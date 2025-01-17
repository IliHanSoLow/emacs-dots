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
(ffap-bindings)

;;start maximized
(cond
 ((eq system-type 'windows-nt)
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  ))

;; enable ido mode
(require 'ido)
(ido-mode t)
(ido-everywhere t)

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
(global-set-key (kbd "C-c h t") 'helm-cmd-t)
(global-set-key (kbd "C-c h g g") 'helm-git-grep)
(global-set-key (kbd "C-c h g l") 'helm-ls-git-ls)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h a") 'helm-org-agenda-files-headings)
(global-set-key (kbd "C-c h r") 'helm-recentf)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(add-to-list 'recentf-exclude "\\.windows\\'")
(add-to-list 'recentf-exclude "\\.revive\\'")
(add-to-list 'recentf-exclude "\\ido.last\\'")

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

;; ---- ---- ---- ----

;; vi %
(defun goto-match-paren (&optional arg)
  "Jump to matching parenthesis according to `show-paren-mode'.
When called with a prefix or EDIT is t, jump to matching
parenthesis such that insertion will happen inside the list.
\(fn &optional EDIT)"
  (interactive "p")
  ;; data is either nil or a list of form:
  ;;     (HERE-BEG HERE-END THERE-BEG THERE-END MISMATCH)
  (let ((data (show-paren--default))
        (edit (not (eq arg 1))))
    (when data
      ;; Found a parenthesis
      (let* ((here-beg (nth 0 data))
			 (here-end (nth 1 data))
             (there-beg (nth 2 data))
             (there-end (nth 3 data))
             (mismatch (nth 4 data)))
        (if (not mismatch)
            ;; At parenthesis with a match
            (cond ((<= (point) here-beg)  ; at opening
                   (goto-char there-end)
                   (if edit (backward-char 1)))
                  ((goto-char there-beg)  ; at closing
                   (if edit (forward-char 1)))))))))
(global-set-key (kbd "C-%") 'goto-match-paren)
