(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-trigger-key nil)
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(anzu-cons-mode-line-p nil)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (spacemacs-light)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "6868ccce2ea88934688ac33c20737f0c4675de6e3801545bca1b2efe0c95392b" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(display-time-mail-face (quote default))
 '(display-time-mode t)
 '(display-time-use-mail-icon t)
 '(erc-input-line-position -1)
 '(erc-mode-hook
   (quote
    (erc-add-scroll-to-bottom pcomplete-erc-setup erc-munge-invisibility-spec erc-button-setup erc-move-to-prompt-setup erc-imenu-setup erc-scrolltobottom-mode)))
 '(erc-modules
   (quote
    (autojoin completion fill keep-place move-to-prompt readonly track ercn hl-nicks netsplit fill button match track completion readonly networks ring autojoin noncommands irccontrols move-to-prompt stamp menu list)))
 '(erc-public-away-p t)
 '(erc-truncate-mode t)
 '(fci-rule-color "#073642")
 '(gnus-alias-default-identity "work")
 '(gnus-alias-identity-alist
   (quote
    (("work" nil "Matthew Erickson <matt@spideroak-inc.com>" nil
      (("FCC" . "\"SpiderOak/Sent Items\" +sent -inbox -unread"))
      nil "Matthew Erickson
Director of Client Services and Technology, SpiderOak
+1 866-432-9888 x703")
     ("personal" nil "Matthew Erickson <peawee@peawee.net>" nil nil nil "--Matt"))))
 '(gnus-alias-identity-rules
   (quote
    (("\"work\""
      ("to" "matt@\\\\(spideroak\\\\.com\\\\|spideroak-inc\\\\.com\\\\)" current)
      "\"work\""))))
 '(gnus-alias-override-user-mail-address t)
 '(gnus-alias-unknown-identity-rule (quote default))
 '(gnus-inhibit-images nil)
 '(gnus-select-method (quote (nnmbox "/var/mail/matt")))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(magit-default-tracking-name-function (quote magit-default-tracking-name-branch-only))
 '(magit-diff-use-overlays nil)
 '(magit-set-upstream-on-push (quote askifnotset))
 '(markdown-command "multimarkdown")
 '(message-fill-column nil)
 '(message-forward-as-mime nil)
 '(mm-inline-large-images (quote resize))
 '(mm-text-html-renderer (quote shr))
 '(mm-w3m-safe-url-regexp nil)
 '(notmuch-crypto-process-mime t)
 '(notmuch-fcc-dirs
   (quote
    (("matt@spideroak-inc.com" . "\"SpiderOak/Sent Items\" +sent"))))
 '(notmuch-hello-thousands-separator ",")
 '(notmuch-identities (quote ("matt@spideroak-inc.com")))
 '(notmuch-mua-compose-in (quote new-frame))
 '(notmuch-poll-script "")
 '(notmuch-saved-searches
   (quote
    ((:name "SpiderOak-Blue" :query "tag:soblue")
     (:name "spideroak-unread" :query "folder:SpiderOak/INBOX AND tag:unread AND tag:inbox")
     (:name "spideroak-inbox" :query "folder:SpiderOak/INBOX AND tag:inbox")
     (:name "inbox" :query "tag:inbox")
     (:name "unread" :query "tag:unread")
     (:name "personal-unread" :query "folder:Personal/INBOX AND tag:unread AND tag:inbox")
     (:name "personal-inbox" :query "folder:Personal/INBOX AND tag:inbox")
     (:name "flagged" :query "tag:flagged")
     (:name "issues-unread" :query "tag:issues and tag:unread")
     (:name "emacs-unread" :query "tag:emacs AND tag:unread")
     (:name "RecentGoToMeeting" :query "GoToMeeting Invitation date:2_weeks.."))))
 '(notmuch-show-all-multipart/alternative-parts nil)
 '(notmuch-show-text/html-blocked-images nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(offlineimap-command "offlineimap -u machineui")
 '(org-agenda-span 5)
 '(org-mac-grab-Acrobat-app-p nil)
 '(org-mac-grab-Firefox-app-p nil)
 '(org-mac-grab-Mail-app-p nil)
 '(org-mac-grab-Safari-app-p nil)
 '(org-mac-grab-devonthink-app-p nil)
 '(org-protocol-outlook-default-template-key (quote o))
 '(package-selected-packages
   (quote
    (org-outlook powershell rw-hunspell apiwrap ghub+ ghub epl pkg-info powerline f restclient org-mime gnus-alias racer cargo flycheck-rust rust-mode fish-mode anzu winum spacemacs-theme diminish spaceline go-snippets dockerfile-mode flycheck async company dash find-file-in-project flymake-easy fsm gh git-commit highlight-indentation ht ivy logito marshal nlinum pcache pyvenv s url-http-ntlm with-editor yasnippet flycheck-status-emoji flycheck-pos-tip flycheck-color-mode-line flycheck-gometalinter objc-font-lock pos-tip irfc magit magit-filenotify magit-gh-pulls magit-popup magithub company-go go-eldoc go-errcheck applescript-mode go-guru nlinum-relative znc yaml-mode xml-rpc w3m todochiku solarized-theme save-packages rainbow-mode pymacs org-plus-contrib org-magit org-mac-link ntcmd nodejs-repl nginx-mode markdown-mode lorem-ipsum js2-mode ipython go-mode gist flymake-python-pyflakes flymake-go exec-path-from-shell excorporate ercn erc-hl-nicks elpy android-mode 2048-game)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values
   (quote
    ((virtualenv-default-directory . "~/Dev/carspeeds")
     (virtualenv-workon . "carspeeds"))))
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(w3m-default-display-inline-images t)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
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
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Source Code Pro")))))
