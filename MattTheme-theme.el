(deftheme MattTheme
  "Created 2014-10-09.")

(custom-theme-set-variables
 'MattTheme
 '(ac-trigger-key nil)
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(display-time-mail-face (quote default))
 '(display-time-use-mail-icon t)
 '(gnus-select-method (quote (nnmbox "/var/mail/matt")))
 '(package-archives (quote (("Marmalade" . "http://marmalade-repo.org/packages/") ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(safe-local-variable-values (quote ((virtualenv-default-directory . "~/Dev/carspeeds") (virtualenv-workon . "carspeeds")))))

(provide-theme 'MattTheme)
