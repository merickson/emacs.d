;; ;; Setup for the modeline mail checking

;; ;;Setup for Notmuch.  It doesn't think very much, apparently.
;; (defun my-notmuch-show-delete ()
;;   "toggle deleted tag for message"
;;   (interactive)
;;   (notmuch-show-add-tag "deleted")
;;   (notmuch-show-remove-tag "inbox")
;;   (notmuch-show-remove-tag "unread"))

;; (defun my-notmuch-search-delete ()
;;   "toggle deleted tag for message"
;;   (interactive)
;;   (notmuch-search-add-tag-thread "deleted")
;;   (notmuch-search-remove-tag-thread "inbox")
;;   (notmuch-search-remove-tag-thread "unread")
;;   (forward-line))

;; (when (file-readable-p "/usr/local/share/emacs/site-lisp/notmuch.el")
;;   (setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))
;;   (require 'notmuch)
;;   (require 'offlineimap)
;;   (offlineimap)
;;   (define-key notmuch-show-mode-map "d" 'my-notmuch-show-delete)
;;   (define-key notmuch-search-mode-map "d" 'my-notmuch-search-delete))

;; ;; Make sure newly sent mail properly gets its buffer killed.
;; (setq message-kill-buffer-on-exit t)

;; ;; Configure for multiple SMTP accounts
;; (setq message-send-mail-function 'message-send-mail-with-sendmail)
;; (setq sendmail-program "msmtp")
;; (setq user-full-name "Matthew Erickson")

;; ;; Following is to auto-set the msmtp account based on the From field.
;; (defun cg-feed-msmtp ()
;;   (if (message-mail-p)
;;       (save-excursion
;;         (let* ((from
;;                 (save-restriction
;;                   (message-narrow-to-headers)
;;                   (message-fetch-field "from")))
;;                (account
;;                 (cond
;;                  ;; I use email address as account label in ~/.msmtprc
;;                  ((string-match "peawee@peawee.net" from)"peawee@peawee.net")
;;                  ;; Add more string-match lines for your email accounts
;;                  ((string-match "matt@spideroak.com" from)"matt@spideroak.com"))))
;;           (setq message-sendmail-extra-arguments (list "-a" account))))))

;; (setq message-sendmail-envelope-from 'header)
;; (add-hook 'message-send-mail-hook 'cg-feed-msmtp)
