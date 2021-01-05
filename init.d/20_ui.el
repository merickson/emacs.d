;; myui.el
;; How I want Emacs to look and feel. 

(require 'nlinum-relative)

;; Set the color scheme
(load-theme 'spacemacs-dark t)
(set-cursor-color "green")

;; Code display options
(global-font-lock-mode 1)
;(setq visible-bell t)
(transient-mark-mode t)
(show-paren-mode 1)
(setq show-paren-style 'expression)
(setq default-indicate-buffer-boundaries 'left)
(setq tuncate-partial-width-windows nil)

;; Configure Anzu mode.
(global-anzu-mode)

;; Winum Mode
(setq winum-auto-setup-mode-line nil)
(winum-mode)

;; Disable extra chrome
(scroll-bar-mode -1)
(tool-bar-mode -1)

; Global highlight mode
(global-hl-line-mode 1)
(set-face-background 'hl-line "grey25")

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

;;; Font management
;; Functions to make finding fonts fast and fun
(defun font-candidate (fonts)
  "Find an installed font from the list of candidates."
  (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(setq mce-default-font-list '("Source Code Pro" "Consolas" "Inconsolata" "Menlo"))
(setq mce-variable-font-list '("Source Sans Pro" "Helvetica" "Segoe UI" "Arial"))

;; Windows renders fonts bigger than Mac, thus the fun.
(defun mce-make-font-candidates (size flist)
  "Formats a list of candidates to work with font-candidate from SIZE and FLIST."
  (when flist
    (cons (concat (car flist) "-" size)
          (mce-make-font-candidates size (cdr flist)))))


;; Face configuration
(set-face-attribute 'default nil :font
                    (font-candidate
                     (mce-make-font-candidates
                      mce-font-size mce-default-font-list)))
(set-face-attribute 'variable-pitch nil :font
                    (font-candidate
                     (mce-make-font-candidates
                      mce-font-size mce-variable-font-list)))

;; Modeline stuff
(setq display-time-24hr-format t)
(require 'spaceline-config)
(setq powerline-height 16)
(spaceline-emacs-theme)
(setq spaceline-window-numbers-unicode t)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-modified)

(require 'diminish)
(diminish 'flycheck-mode)
(diminish 'anzu-mode)
(diminish 'flymake-mode)
