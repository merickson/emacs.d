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

(yas-global-mode)

; Spell checking
(if (string= system-type "windows-nt")
    (setq ispell-local-dictionary-alist (quote ((nil "[[:alpha:]]" "[^[:alpha:]]" "[']" t ("-d" "en_US") nil utf-8))))
  (progn
    (setq ispell-program-name "aspell")
    (setq ispell-list-command "list")))

; TRAMP configuration
(setq tramp-default-method "ssh")

;; Set the backup files to go into a specific directory.
(setq backup-directory-alist
      (list (cons "." (expand-file-name "backup" mce-emacs-config-dir))))

;; Configure tooltips for ElDoc
(require 'pos-tip)

;; Disable disabling some commands.
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
