;; Editing-specific customizations

; Use spaces instead of tabs.
(setq-default indent-tabs-mode nil)

; If the buffer is read-only, kill just pulls to the killring without removal.
(setq kill-read-only-ok t)

; ido-mode
(require 'ido)
(ido-mode t)

(add-hook 'after-init-hook 'global-company-mode)
(global-flycheck-mode)

; Spell checking
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")

; TRAMP configuration
(setq tramp-default-method "ssh")

;; Set the backup files to go into a specific directory.
(setq backup-directory-alist
      (list (cons "." (expand-file-name "backup" mce-emacs-config-dir))))

;; Configure tooltips for ElDoc
(require 'pos-tip)
;; (defun my-eldoc-display-message (format-string &rest args)
;;   "Display eldoc message near point"
;;   (when format-string
;;     (pos-tip-show (apply 'format format-string args))))
;; (setq eldoc-message-function #'my-eldoc-display-message)
