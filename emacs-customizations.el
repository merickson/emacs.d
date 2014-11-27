(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-trigger-key nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(display-time-mail-face (quote default))
 '(display-time-mode t)
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
 '(magit-default-tracking-name-function (quote magit-default-tracking-name-branch-only))
 '(magit-set-upstream-on-push (quote askifnotset))
 '(markdown-command "multimarkdown")
 '(message-fill-column nil)
 '(mm-text-html-renderer (quote w3m))
 '(notmuch-crypto-process-mime t)
 '(notmuch-poll-script "")
 '(notmuch-saved-searches (quote (("SpiderOak-Blue" . "tag:soblue") ("spideroak-unread" . "folder:Spideroak/INBOX AND tag:unread AND tag:inbox") ("spideroak-inbox" . "folder:Spideroak/INBOX AND tag:inbox") ("inbox" . "tag:inbox") ("unread" . "tag:unread") ("personal-unread" . "folder:Personal/INBOX AND tag:unread AND tag:inbox") ("personal-inbox" . "folder:Personal/INBOX AND tag:inbox") ("flagged" . "tag:flagged") ("issues" . "(from:trac@spideroak.com or from:notifications@github.com or avg-trac@spideroak.com)") ("issues-unread" . "(from:trac@spideroak.com or from:notifications@github.com or avg-trac@spideroak.com) and tag:unread") ("emacs-unread" . "tag:emacs AND tag:unread") ("RecentGoToMeeting" . "GoToMeeting Invitation date:2_weeks.."))))
 '(notmuch-show-all-multipart/alternative-parts nil)
 '(offlineimap-command "offlineimap -u machineui")
 '(org-agenda-span 5)
 '(safe-local-variable-values (quote ((virtualenv-default-directory . "~/Dev/carspeeds") (virtualenv-workon . "carspeeds"))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#042028" :foreground "#708183" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Source_Code_Pro"))))
;;  '(mode-line ((t (:box nil :underline nil :slant normal :weight normal :height 100 :family "Source_Code_Pro"))))
;;  '(mode-line-buffer-id ((t (:inherit mode-line :weight bold))))
;;  '(mode-line-emphasis ((t (:inherit mode-line :weight bold))))
;;  '(mode-line-highlight ((t (:inherit mode-line :box (:line-width 2 :color "grey40" :style released-button)))))
;;  '(mode-line-inactive ((t (:inherit mode-line :inverse-video t :box nil)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))
