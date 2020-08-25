;;; Rust customizations

; Enable cargo-mode
(add-hook 'rust-mode-hook 'cargo-minor-mode)

; Configure rustfmt
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
(add-hook 'rust-mode-hook #'rust-enable-format-on-save)

                                        ; Configure racer
(setq racer-cmd "~/.cargo/bin/racer")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
