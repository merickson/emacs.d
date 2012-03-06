;; myui.el
;; How I want Emacs to look and feel.

;; Color scheme.
(add-to-list 'default-frame-alist '(foreground-color . "white"))
(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(font . "Mensch-12"))

(set-cursor-color "green")

;; Code display options
(global-font-lock-mode 1)
(setq visible-bell t)
(transient-mark-mode t)
(show-paren-mode 1)
(setq show-paren-style 'expression)
(setq default-indicate-buffer-boundaries 'left)
(setq tuncate-partial-width-windows nil)

;; Modeline stuff
(setq display-time-24hr-format t)
(display-time-mode)

;; Of things relating to line and column numbers.
(column-number-mode t)
;; Only show line numbers where we want it.
(add-hook 'mce-code-modes-hook
	  (lambda () (linum-mode t)))

;; Disable extra chrome
(scroll-bar-mode -1)
(tool-bar-mode -1)

; Global highlight mode
(global-hl-line-mode 1)
(set-face-background 'hl-line "grey15")

;; Font!
(set-default-font "Mensch-12")

;; Compilation-mode
; Tell compile mode to always follow the bottom of the compile.
(setq compilation-scroll-output t)
