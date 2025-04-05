(require 'evil)
(define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
(setq evil-undo-system 'undo-tree)

(defhydra hydra-space
		  ;; (:hint nil)
  ("f" project-find-file)
  ("F" find-file)
  ("b" switch-to-buffer)
  ;; ("j" jumplist_picker)
  ;; ("g" changed_file_picker)
  ;; ("G" nil)  ;; Debug, experimental, no command assigned
  ("s" imenu)
  ("S" ivy-imenu-anywhere)
  ("d" flymake-show-buffer-diagnostics)
  ("D" flymake-show-project-diagnostics)
  ("r" eglot-rename)
  ("a" eglot-code-actions)
  ("h" xref-find-all-references)
  ;; ("w" nil)  ;; Enter window mode, no command assigned
  ("c" comment-line)
  ;; ("C" toggle_block_comments)
  ("p" paste_clipboard_after)
  ("P" paste_clipboard_before)
  ("y" yank_to_clipboard)
  ("Y" yank_main_selection_to_clipboard)
  ("/" project-search)
  ("?" execute-extended-command)
  ("u" undo-tree-visualize)
  )

(use-package general
  :ensure t
  :init
  (setq general-override-states '(insert
                                  emacs
                                  hybrid
                                  normal
                                  visual
                                  motion
                                  operator
                                  replace))
  :config
  (general-define-key
   :states '(normal visual motion)
   :keymaps 'override
   "SPC" 'hydra-space/body))
