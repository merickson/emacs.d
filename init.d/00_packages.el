; Configure packages
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(setq mce-required-packages
      (list 'xml-rpc 'magit 'gh 'gist 'yasnippet 'ipython))
(dolist (package mce-required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))

; Setup notmuch
(when (file-directory-p "~/src/notmuch/emacs")
  (add-to-list 'load-path "~/src/notmuch/emacs"))

; Setup the external packages load paths.
(setq mce-elisp-external-dir
      (expand-file-name "external" mce-emacs-config-dir))
(dolist (project (directory-files mce-elisp-external-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))
