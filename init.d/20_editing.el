;; Editing-specific customizations

(require 'auto-complete-yasnippet)

; Use spaces instead of tabs.
(setq-default indent-tabs-mode nil)

; If the buffer is read-only, kill just pulls to the killring without removal.
(setq kill-read-only-ok t)

; Auto-complete mode
(require 'auto-complete)
(global-auto-complete-mode t)
(ac-flyspell-workaround)

; Yasnippet
(require 'yasnippet)
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(yas/load-directory (expand-file-name "snippets" mce-emacs-config-dir))

; Spell checking
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")

; TRAMP configuration
(setq tramp-default-method "ssh")

