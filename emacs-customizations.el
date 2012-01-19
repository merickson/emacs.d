(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-trigger-key nil)
 '(display-time-use-mail-icon t)
 '(gnus-alias-identity-alist (quote (("SpiderMatt" "" "\"Matthew Erickson\" <matt@spideroak.com>" "SpiderOak, Inc." (("Gcc" . "nnimap+SpiderOak Mail:Spideroak/Sent Messages")) "-- Matt" "") ("ProSpiderMatt" "SpiderMatt" "" "" nil "" "Matthew Erickson, Director of Programming") ("Peawee" "" "\"Matt Erickson\" <peawee@peawee.net>" "" nil "" "-- Matt"))))
 '(gnus-alias-identity-rules nil)
 '(gnus-select-method (quote (nnmbox "/var/mail/matt")))
 '(notmuch-poll-script "/Users/matt/bin/postprocess_new_mail.sh")
 '(notmuch-saved-searches (quote (("SpiderOak-Blue" . "tag:soblue") ("spideroak-unread" . "folder:inbox AND to:*@spideroak.com AND tag:unread") ("spideroak-inbox" . "folder:inbox AND tag:inbox AND to:*@spideroak.com") ("inbox" . "tag:inbox") ("unread" . "tag:unread") ("personal-unread" . "to:*@peawee.net AND tag:unread AND folder:inbox") ("personal-inbox" . "tag:inbox AND to:*@peawee.net AND NOT (folder:spam OR folder:junk)"))))
 '(offlineimap-command "offlineimap -u machineui")
 '(package-archives (quote (("Marmalade" . "http://marmalade-repo.org/packages/") ("gnu" . "http://elpa.gnu.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "grey75" :foreground "black" :box (:line-width -1 :style released-button) :height 0.85 :family "Inconsolata")))))
