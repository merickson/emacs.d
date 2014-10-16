;; ;; Setup for the modeline mail checking

;; ;;Setup for Notmuch.  It doesn't think very much, apparently.
;; (defun my-notmuch-show-delete ()
;;   "toggle deleted tag for message"
;;   (interactive)
;;   (notmuch-show-tag "+deleted" "-inbox" "-unread"))

;; (defun my-notmuch-search-delete ()
;;   "toggle deleted tag for message"
;;   (interactive)
;;   (notmuch-search-tag '("+deleted" "-inbox" "-unread"))
;;   (forward-line))

;; (require 'gnus-art)
;; (require 'gnus-alias)
;; (setq gnus-alias-identity-alist
;;       '(("work-big"
;;          nil
;;          "Matthew Erickson <matt@spideroak.com>"
;;          nil ;;no organization header
;;          (("Fcc" . "~/Mail/Spideroak/Sent Messages"))
;;          nil ;;no body text
;;          "Matthew Erickson
;; Director of Software Development, SpiderOak
;; skype: peawee03"
;;          )
;;         ("work"
;;          nil
;;          "Matthew Erickson <matt@spideroak.com>"
;;          nil ;;no organization header
;;          (("Fcc" . "~/Mail/Spideroak/Sent Messages"))
;;          nil ;;no body text
;;          "Matt"
;;          )
;;         ("personal"
;;          nil
;;          "Matthew Erickson <peawee@peawee.net>"
;;          nil
;;          (("Fcc" . "~/Mail/Personal/Sent Messages"))
;;          nil
;;          "Matt")))


;; (require 'notmuch)
;; (define-key notmuch-show-mode-map "d" 'my-notmuch-show-delete)
;; (define-key notmuch-search-mode-map "d" 'my-notmuch-search-delete)

;; (setq notmuch-multipart/alternative-discouraged '("text/plain" "multipart/related"))

;; ;; Check notmuch for new email.
;; (defun mce-filter-search-list ()
;;   "Filters the search list for what counts for new mail indication"
;;   (remove-if nil
;;              (mapcar (lambda (search)
;;                        (when (member (car search)
;;                                      mce-newmail-searches)
;;                          search))
;;                      notmuch-saved-searches)))

;; (defun mce-check-new-email ()
;;   "t if there is new unread email, nil if not"
;;   (< 0 
;;       (reduce '+
;;               (mapcar (lambda (x) (car (last x)))
;;                       (notmuch-hello-query-counts (mce-filter-search-list))))))

;; (setq display-time-mail-function 'mce-check-new-email)

;; ;; Make sure newly sent mail properly gets its buffer killed.
;; (setq message-kill-buffer-on-exit t)

;; ;; Configure for multiple SMTP accounts
;; (setq message-send-mail-function 'message-send-mail-with-sendmail)
;; (setq sendmail-program "run_msmtp.sh")
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

;; ;; External ABook integration
;; (require 'external-abook)
;; (setq external-abook-command "contacts -lf '%%e\t%%n' %s")

;; (eval-after-load "message"
;;   '(progn
;;      (add-to-list 'message-mode-hook
;;                   '(lambda ()
;;                      (define-key message-mode-map "\C-c\t" 'external-abook-try-expand)))
;;      (add-to-list 'message-mode-hook 'flyspell-mode)
;;      (add-to-list 'message-mode-hook 'visual-line-mode)))
