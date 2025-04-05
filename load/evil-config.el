(require 'evil)
(require 'general)
(define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
(setq evil-undo-system 'undo-redo)

(general-evil-setup)
(general-nmap
  :prefix "SPC"

  ";" 'evil-ex
  "f" 'project-find-file
  "F" 'find-file
  "b" 'switch-buffer
  ;; "j" 'jumplist_picker
  ;; "g" 'changed_file_picker
  ;; "G" 'nil  ;; Debug, experimental, no command assigned
  "s" 'imenu
  "S" 'ivy-imenu-anywhere
  "d" 'flymake-show-buffer-diagnostics
  "D" 'flymake-show-project-diagnostics
  "r" 'eglot-rename
  "a" 'eglot-code-actions
  "h" 'xref-find-all-references
  ;; "w" 'nil  ;; Enter window mode, no command assigned
  "c" 'comment-line
  ;; "C" 'toggle_block_comments
  ;; "p" 'simpleclip-paste
  ;; "y" 'simpleclip-commentpy
  "/" 'project-search
  "?" 'execute-extended-command
  ;; "u" 'undo-tree-visualize
  )
