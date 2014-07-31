;; Python customizations

;;(require 'ipython)
(require 'flymake-python-pyflakes)

; Twisted.
(setq auto-mode-alist (cons '("\\.tac\\'" . python-mode) auto-mode-alist))


;;;; Pymacs customizations
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(pymacs-load "ropemacs" "rope-")


(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m)

(add-hook 'python-mode-hook
          '(lambda ()
             (auto-complete-mode 1)
             (flymake-python-pyflakes-load)
             (ropemacs-mode)
;             (define-key python-mode-map "\t" 'mce-ac-tab)
             ))
