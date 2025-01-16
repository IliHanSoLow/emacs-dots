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

;; org
(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
 '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))

(add-hook 'org-mode-hook 'visual-line-mode)

(custom-theme-set-faces
 'user
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
