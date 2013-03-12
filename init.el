;; My .emacs.  There are many like it, but this one is mine.

;; Basic setup
(require 'cl)
(require 'eieio) ; for gh.el
(require 'netrc)
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

;; Load the private data file if it exists on this machine.
(setq mce-privdata-file (expand-file-name "mce-priv-data.el" mce-emacs-config-dir))
(when (file-readable-p mce-privdata-file)
  (load mce-privdata-file))

; Load in some customizations.
(if (file-exists-p mce-emacs-init-dir)
    (dolist (file (directory-files mce-emacs-init-dir t "\\.el$"))
      (load file)))


(put 'narrow-to-region 'disabled nil)
