; Configure packages
(setq package-archives
      '(("org" . "http://orgmode.org/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "https://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("elpy" . "https://jorgenschaefer.github.io/packages/")))


(package-initialize)

(setq mce-required-packages
      (list 'save-packages))
(dolist (package mce-required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))

(install-saved-packages)

; Setup notmuch
(when (file-directory-p "~/src/notmuch/emacs")
  (add-to-list 'load-path "~/src/notmuch/emacs"))

; Setup the external packages load paths.
(setq mce-elisp-external-dir
      (expand-file-name "external" mce-emacs-config-dir))
(dolist (project (directory-files mce-elisp-external-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))
