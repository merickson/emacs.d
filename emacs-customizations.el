(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-trigger-key nil)
 '(display-time-use-mail-icon t)
 '(erc-input-line-position -1)
 '(erc-mode-hook (quote (erc-add-scroll-to-bottom pcomplete-erc-setup erc-munge-invisibility-spec erc-button-setup erc-move-to-prompt-setup erc-imenu-setup erc-scrolltobottom-mode)))
 '(erc-modules (quote (autojoin completion fill keep-place move-to-prompt readonly track ercn hl-nicks netsplit fill button match track completion readonly networks ring autojoin noncommands irccontrols move-to-prompt stamp menu list)))
 '(erc-public-away-p t)
 '(erc-truncate-mode t)
 '(gnus-alias-identity-alist (quote (("SpiderMatt" "" "\"Matthew Erickson\" <matt@spideroak.com>" "SpiderOak, Inc." (("Gcc" . "nnimap+SpiderOak Mail:Spideroak/Sent Messages")) "-- Matt" "") ("ProSpiderMatt" "SpiderMatt" "" "" nil "" "Matthew Erickson, Director of Programming") ("Peawee" "" "\"Matt Erickson\" <peawee@peawee.net>" "" nil "" "-- Matt"))))
 '(gnus-alias-identity-rules nil)
 '(gnus-inhibit-images nil)
 '(gnus-select-method (quote (nnmbox "/var/mail/matt")))
 '(message-fill-column nil)
 '(notmuch-crypto-process-mime t)
 '(notmuch-poll-script "")
 '(notmuch-saved-searches (quote (("SpiderOak-Blue" . "tag:soblue") ("spideroak-unread" . "folder:Spideroak/INBOX AND tag:unread AND tag:inbox") ("spideroak-inbox" . "folder:Spideroak/INBOX AND tag:inbox") ("inbox" . "tag:inbox") ("unread" . "tag:unread") ("personal-unread" . "folder:Personal/INBOX AND tag:unread AND tag:inbox") ("personal-inbox" . "folder:Personal/INBOX AND tag:inbox") ("flagged" . "tag:flagged") ("issues" . "(from:trac@spideroak.com or from:notifications@github.com or avg-trac@spideroak.com)") ("issues-unread" . "(from:trac@spideroak.com or from:notifications@github.com or avg-trac@spideroak.com) and tag:unread") ("emacs-unread" . "tag:emacs AND tag:unread") ("RecentGoToMeeting" . "GoToMeeting Invitation date:2_weeks.."))))
 '(notmuch-show-all-multipart/alternative-parts nil)
 '(offlineimap-command "offlineimap -u machineui")
 '(org-agenda-span 5)
 '(package-archives (quote (("Marmalade" . "http://marmalade-repo.org/packages/") ("gnu" . "http://elpa.gnu.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "adobe" :family "Source Code Pro"))))
 '(mode-line ((t (:background "#0a2832" :foreground "#81908f" :inverse-video t :box nil :underline nil :slant normal :weight normal :height 0.85 :family "Mensch"))))
 '(mode-line-inactive ((t (:background "#0a2832" :foreground "#52676f" :inverse-video t :box nil :underline nil :slant normal :weight normal :height 0.85 :family "Mensch")))))
