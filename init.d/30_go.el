;;; Go customizations.

(require 'go-mode)
(require 'go-guru)

(setq gofmt-command "goimports")

;; Make sure we run go fmt as we save.
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook
     (lambda ()
              (set (make-local-variable 'company-backends) '(company-go))
              (company-mode)))
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook 'nlinum-relative-mode)

(defun mce-go-funcall-err-returnp ()
  "Determines if there's an err variable returned by the function call under point."
  (save-excursion
    (beginning-of-line)
    (re-search-forward (regexp-quote "err :="))))

