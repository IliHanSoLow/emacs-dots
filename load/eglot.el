;; nixd
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'eglot-format nil t)))
(with-eval-after-load 'eglot
  (dolist (mode '((nix-mode . ("nixd"))))
    (add-to-list 'eglot-server-programs mode)))
(add-hook 'nix-mode-hook #'eglot-ensure)
(add-hook 'godot-mode-hook #'eglot-ensure)
