;;; Rust customizations

; Enable cargo-mode
;(add-hook 'rust-mode-hook 'cargo-minor-mode)

; Configure rustfmt
;; (add-hook 'rust-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
;; (add-hook 'rust-mode-hook #'rust-enable-format-on-save)

                                        ; Configure racer
(setq racer-cmd "~/.cargo/bin/racer")

(add-hook 'rust-mode-hook 'rustic-mode)

(defun mce-set-rust-path ()
  "Set the rust-src-path based on the toolchain."
  (concat (file-name-as-directory
           (replace-regexp-in-string "\n$" "" (shell-command-to-string "rustc --print sysroot")))
          "lib/rustlib/src/rust/library"))

;; (add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode)
;; (add-hook 'racer-mode-hook #'company-mode)
;; (require 'rust-mode)
;; (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;; (define-key rust-mode-map (kbd "<f12>") #'racer-describe-tooltip)
(setq company-tooltip-align-annotations nil)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(setq rustic-format-trigger 'on-save)
;;(add-hook 'rust-mode-hook (lambda () (setq racer-rust-src-path (mce-set-rust-path))))
