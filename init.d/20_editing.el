;; Editing-specific customizations

; Use spaces instead of tabs.
(setq-default indent-tabs-mode nil)

; If the buffer is read-only, kill just pulls to the killring without removal.
(setq kill-read-only-ok t)

; ido-mode
(require 'ido)
(ido-mode t)

; Auto-complete mode
(require 'auto-complete)
(global-auto-complete-mode t)
(ac-flyspell-workaround)

; Yasnippet
;(require 'yasnippet)
;(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
;(yas/initialize)
;(yas/load-directory (expand-file-name "snippets" mce-emacs-config-dir))

(require 'auto-complete-yasnippet)


; Spell checking
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")

; TRAMP configuration
(setq tramp-default-method "ssh")

;; Set the backup files to go into a specific directory.
(setq backup-directory-alist
      (list (cons "." (expand-file-name "backup" mce-emacs-config-dir))))
