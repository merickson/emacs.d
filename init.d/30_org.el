;; Org-mode customizations.
(require 'org-install)
;(require 'org-notmuch)
(require 'org-protocol)
(require 'org-mac-link)
(require 'org-outlook)

;; Set the file structure properly based on OS.
(if (string-equal system-type "windows-nt")
    (setq org-directory (concat (getenv "HOME") "\\Dropbox\\OrgFiles\\"))
  (setq org-directory "~/Dropbox/OrgFiles/"))
(setq diary-file (concat org-directory "diary"))
(setq org-agenda-files (list (concat org-directory "capture.org")
                             (concat org-directory "Spideroak.org")
                             (concat org-directory "Aricorn.org")
                             (concat org-directory "DPA.org")
                             (concat org-directory "Personal.org")))

;;; Autosavery
;; The goal is to stay in sync with whatever's in the org-files directory.
;; To do that, we are going to do two things:
;; 1. Enable auto-revert mode to pick up changes from mobile ASAP
;; 2. Automatically save org buffers whenever a buffer is left or Emacs loses
;;    focus.
(add-hook 'org-mode-hook 'auto-revert-mode)
(add-hook 'focus-out-hook (lambda () (save-buffers-with-major-mode 'org-mode)))


(setq mce-org-completed-tasks (concat org-directory "completed.org"))

(setq org-log-done t)
(setq org-insert-mode-line-in-empty-file t)
(setq org-use-fast-todo-selection t)
(setq org-enforce-todo-dependencies t)

;;; Tag configuration
(setq org-use-tag-inheritance t)
(setq org-tags-exclude-from-inheritance '("PROJECT" "SALE"))

;;; Capture / refile configuration
(setq org-refile-use-outline-path t)
(setq org-default-notes-file (concat org-directory "capture.org"))
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9)
                                 (mce-org-completed-tasks :maxlevel . 9))))

;;; Org agenda configuration.
(setq org-agenda-show-all-dates t)
(setq org-agenda-window-setup (quote current-window))
(setq org-agenda-dim-blocked-tasks t)

(setq org-agenda-include-diary t)
(setq org-deadline-warning-days 3)
(setq org-timeline-show-empty-dates t)

(setq org-agenda-custom-commands
      '(
        ("P" "Projects"
         ((tags "PROJECT")))
        ("W" "Work Lists"
         ((agenda)
          (tags-todo "@computer")
          (tags-todo "@messaging")
          (tags-todo "@phone")
          (tags-todo "WORK-PROJECT-SALE")))
        ("D" "Daily Action List"
         ((agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up))))
                      (org-deadline-warning-days 0)
                      ))))
        ))

;; Org capture templates
(setq org-capture-templates
      (quote (("t" "todo" entry (file "capture.org")
               "* TODO %?\n%U\n  %i")
              ("p" "todo at point" entry (file "capture.org")
               "* TODO %?\n%U\n%a\n  %i")
              ("c" "calendar" entry (file "capture.org")
               "* %?  %i")
              ("n" "note" entry (file "capture.org")
               "* %? :NOTE:\n%U\n%a\n  %i")
              ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
               "* %?\n%U\n  %i")
              ("o" "org-outlook" entry (file "capture.org")
               "* TODO %?\n%i\n%U\n%c")
              ("L" "Protocol Link" entry (file "capture.org")
               "* %? [[%:link][%:description]] \nCaptured On: %U")
              ("C" "org-chrome" entry (file "capture.org")
               (function mce-org-get-chrome-entry)))))

(setq excorporate-configuration '("matt@spideroak-inc.com" . "https://outlook.office365.com/EWS/Exchange.asmx"))

;;; Mac-org configuration
(defun mce-org-get-outlook-entry ()
  "Gets the selected Mac Outlook entry and makes a capture template around it."
  (concat "* TODO " (org-mac-outlook-message-get-links "s") " \n%U\n %?"))

(defun mce-org-get-chrome-entry ()
  "Gets the selected Chrome entry and makes a capture template around it."
  (concat "* TODO " (org-mac-chrome-get-frontmost-url) " \n%U\n %?"))

(defadvice org-capture-finalize (after delete-remember-frame activate)
  "Advise remember-finalize to close the frame if it is the remember frame"
  (if (equal "Org-Capture" (frame-parameter nil 'name))
      (delete-frame)))

(defadvice org-capture-destroy (after delete-remember-frame activate)
  "Advise remember-destroy to close the frame if it is the rememeber frame"
  (if (equal "Org-Capture" (frame-parameter nil 'name))
      (delete-frame)))

(defun make-remember-frame ()
  "Create a new frame and run org-remember."
  (interactive)
  (make-frame '((name . "Org-Capture") (width . 80) (height . 30)))
  (select-frame-by-name "Org-Capture")
  (org-capture)
  (delete-other-windows))

;;; Make sure excorporate updates every time my agenda refreshes.
;; (defun mce/agenda-update-diary ()
;;   "call excorporate to update the diary for today"
;;   (exco-diary-diary-advice (calendar-current-date) (calendar-current-date) #'message "diary updated"))

;(excorporate)
;(excorporate-diary-enable)

;(add-hook 'org-agenda-cleanup-fancy-diary-hook 'mce/agenda-update-diary)


;;; Desktop notifications 
(require 'appt)
(setq appt-time-msg-list nil)
(setq appt-display-interval '5)
(setq appt-message-warning-time '15
      appt-display-mode-line nil
      appt-display-format 'window)
(appt-activate 1)

(org-agenda-to-appt)
(run-at-time t 1800 'org-agenda-to-appt)
(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)

; see https://joonro.github.io/blog/posts/toast-notifications-org-mode-windows.html
(when (string-equal system-type "windows-nt")
  (setq toast-notifier-path "\"c:\\Users\\Matthew Erickson\\git\\toaster\\toast\\bin\\Release\\toast.exe\"")
  (defun toast-appt-send-notification (title msg)
    (shell-command (concat toast-notifier-path
                           " -t \"" title "\""
                           " -m \"" msg "\""
                           " -p \"C:\\Users\\Matthew Erickson\\Dropbox\\org_mode.png\"")))
  (defun toast-appt-display (min-to-app new-time msg)
    (toast-appt-send-notification
     (format "Appointment in %s minutes" min-to-app)
     (format "%s" msg)))
  (setq appt-disp-window-function (function toast-appt-display)))
