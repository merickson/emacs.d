;; Global key re-mappings.

;; Make copy-region-as-kill more accessible.
(global-set-key "\C-c\w" `copy-region-as-kill)
(global-set-key "\C-c\C-w" `copy-region-as-kill)

;; Set goto-line to something easier, as well.
(global-set-key "\C-c\C-g" `goto-line)

;; Set other-previous-window to something with sanity (as opposed to
;; apple keys)
(global-set-key "\C-c\o" `other-previous-window)


;; Always handle comments how I like
(global-set-key "\C-c\;" 'comment-or-uncomment-region)

;;;; F-key remappings
;; F1

;; F2 should always mean something to do with the shell.
;;(global-set-key [(shift f2)] 'ansi-term)

;; F3
;;(global-set-key [f3] 'notmuch)
;;(global-set-key [(shift f3)] 'gnus-alias-select-identity)

;; Meta-F3: goto *scratch*
(defun switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))
(global-set-key [(meta f3)] 'switch-to-scratch)

;; F4
;;(global-set-key [f4] 'ac-start)

;; F5
(global-set-key [f5] 'compile)
(global-set-key [(shift f5)] 'flymake-start-syntax-check)

;; F6
(global-set-key [f6] 'kmacro-start-macro)
(global-set-key [(shift f6)] 'kmacro-end-or-call-macro)

;; F7
(global-set-key [f7] 'webjump)

;; F8
(global-set-key [f8] 'flymake-goto-next-error)

;; F9
(global-set-key [f9] 'magit-status)

;; F10
;;(global-set-key [f10] 'org-agenda)
;;(global-set-key [(control f10)] 'make-remember-frame)
;;(global-set-key [(shift f10)] 'org-store-link)
;;(global-set-key [(meta f10)] 'org-iswitchb)

;; F11
;;(global-set-key [f11] 'switch-to-buffer-other-window)

;;;; Aliases!
(defalias 'qrr 'query-replace-regexp)
(defalias 'fm 'flymake-mode)
(defalias 'ms 'magit-status)
(defalias 'mpull 'magit-pull)
(defalias 'gaid 'gnus-alias-select-identity)
