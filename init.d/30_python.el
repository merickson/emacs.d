;; Python customizations

;;(require 'ipython)
(require 'flymake-python-pyflakes)

; Twisted.
(setq auto-mode-alist (cons '("\\.tac\\'" . python-mode) auto-mode-alist))

(elpy-enable)

;;;; Pymacs customizations
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (pymacs-load "ropemacs" "rope-")


(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m)

(when (load "flymake" t)
 (defun flymake-pylint-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
 'flymake-create-temp-inplace))
 (local-file (file-relative-name
 temp-file
 (file-name-directory buffer-file-name))))
 (list "epylint" (list local-file))))

 (add-to-list 'flymake-allowed-file-name-masks
 '("\\.py\\'" flymake-pylint-init))
 (add-to-list 'flymake-allowed-file-name-masks
 '("\\.tac\\'" flymake-pylint-init)))

(add-hook 'python-mode-hook
          '(lambda ()
             (flymake-mode)
             (auto-complete-mode 1)
             ;; (ropemacs-mode)
             ;(define-key python-mode-map "\t" 'mce-ac-tab)
             ))
