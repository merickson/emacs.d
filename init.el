;; My .emacs.  There are many like it, but this one is mine.

;; Basic setup
(require 'cl)
(require 'eieio) ; for gh.el
(server-start)

;; Figure out where we are...
(setq mce-emacs-init-file load-file-name)
(setq mce-emacs-config-dir
      (file-name-directory mce-emacs-init-file))
(setq mce-emacs-init-dir
      (concat mce-emacs-config-dir "init.d"))

;; Configure the customizations file
(setq custom-file
      (expand-file-name "emacs-customizations.el" mce-emacs-config-dir))
(load custom-file)

; Load in some customizations.
(if (file-exists-p mce-emacs-init-dir)
    (dolist (file (directory-files mce-emacs-init-dir t "\\.el$"))
      (load file)))


