;; No HTML mail
(setq mm-discouraged-alternatives '("text/html" "text/richtext"))

(defadvice gnus-demon-scan-news (around gnus-demon-timeout activate)
  "Timeout for Gnus."
  (with-timeout
      (60 (message "Gnus timed out."))
    ad-do-it))
(defun mce-gnus-update ()
  (interactive)
  (gnus-demon-scan-news))

(gnus-demon-add-handler 'mce-gnus-update 5 nil)

(defun mce-check-newmail ()
  "Updates notmuch and provides an update as to if there's email"
  (>
   (+ (gnus-group-unread "nnimap+SpiderOak Mail:Spideroak/INBOX")
      (gnus-group-unread "nnimap+SpiderOak Mail:Personal/INBOX"))
   0))
(setq display-time-mail-function 'mce-check-newmail)

(setq gnus-posting-styles
      '(
        ((header "to" "matt@spideroak.com")
         (address "matt@spideroak.com"))
        ((header "cc" "matt@spideroak.com")
         (address "matt@spideroak.com"))
        ((header "to" "peawee@peawee.net")
         (address "peawee@peawee.net"))
        ((header "cc" "peawee@peawee.net")
         (address "peawee@peawee.net"))))

;(require 'gnus-alias)
;(gnus-alias-init)
