;; myui.el
;; How I want Emacs to look and feel. 

(require 'nlinum-relative)

;; Set the color scheme
(load-theme 'solarized-dark t)
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

;; Compilation-mode
; Tell compile mode to always follow the bottom of the compile.
(setq compilation-scroll-output t)

;; Auto-Revert mode, and auto-revert for dired.
(global-auto-revert-mode 1)

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Use a bar cursor when mark is active and a region exists.
(defun th-activate-mark-init ()
  (setq cursor-type 'bar))
(add-hook 'activate-mark-hook 'th-activate-mark-init)

(defun th-deactivate-mark-init ()
  (setq cursor-type 'box))
(add-hook 'deactivate-mark-hook 'th-deactivate-mark-init)

;; Use a red cursor in overwrite-mode
(defvar th--default-cursor-color "black")
(defadvice overwrite-mode (after th-overwrite-mode-change-cursor activate)
  "Change cursor color in override-mode."
  (if overwrite-mode
      (progn
        (setq th--default-cursor-color
              (let ((f (face-attribute 'cursor :background)))
                (if (stringp f)
                    f
                  th--default-cursor-color)))
        (set-cursor-color "red"))
    (set-cursor-color th--default-cursor-color)))

(defun font-candidate (&rest fonts)
  (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(set-face-attribute 'default nil :font (font-candidate '"Consolas-14:weight=normal" "Inconsolata-13:weight=normal" "Menlo-14:weight=normal"))
