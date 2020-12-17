;; My .emacs.  There are many like it, but this one is mine.

;; Basic setup

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (version< emacs-version "27.0") (package-initialize))

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

