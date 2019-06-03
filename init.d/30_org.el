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
                             (concat org-directory "biggtd.org")))

(setq mce-org-completed-tasks (concat org-directory "completed.org"))

(setq org-log-done t)
(setq org-agenda-include-diary t)
(setq org-deadline-warning-days 7)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)
(setq org-refile-use-outline-path t)
(setq org-use-fast-todo-selection t)
(setq org-use-tag-inheritance nil)
(setq org-default-notes-file (concat org-directory "capture.org"))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9)
                                 (mce-org-completed-tasks :maxlevel . 9))))
;; Org agenda configuration.
(setq org-agenda-show-all-dates t)
(setq org-agenda-window-setup (quote current-window))

(setq org-agenda-custom-commands
      '(
        ("P" "Projects"
         ((tags "PROJECT")))
        ("W" "Work Lists"
         ((agenda)
          (tags-todo "WORK")
          (tags-todo "COMPUTER")
          (tags-todo "READING")))
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
               "* TODO %?\n%U\n%a\n  %i")
              ("c" "calendar" entry (file "capture.org")
               "* %?  %i")
              ("n" "note" entry (file "capture.org")
               "* %? :NOTE:\n%U\n%a\n  %i")
              ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
               "* %?\n%U\n  %i")
              ("o" "org-outlook" entry (file "capture.org")
               "* TODO Email %c %? %i %u")
              ("C" "org-chrome" entry (file "capture.org")
               (function mce-org-get-chrome-entry))
              ("p" "Phone call" entry (file "capture.org")
               "* PHONE %? :PHONE:\n%U"))))


(setq org-link-abbrev-alist
      '(("sotrac" . "https://treehouse.spideroak.com/pandora/ticket/")
        ("sort"   . "https://treehouse.spideroak.com/rt-beta/Ticket/Display.html?id=")))

(setq excorporate-configuration '("matt@spideroak-inc.com" . "https://outlook.office365.com/EWS/Exchange.asmx"))

(defun mce-org-get-outlook-entry ()
  "Gets the selected Mac Outlook entry and makes a capture template around it."
  (concat "* TODO " (org-mac-outlook-message-get-links "s") " \n%U\n %?"))

(defun mce-org-get-chrome-entry ()
  "Gets the selected Chrome entry and makes a capture template around it."
  (concat "* TODO " (org-mac-chrome-get-frontmost-url) " \n%U\n %?"))

(defun mce-org-mobpush ()
  "Runs org-mobile-push and SCP's the result to a remote server."
  (interactive)
  (org-mobile-push)
  (let
      ((localpush
        (convert-standard-filename 
         (substitute-in-file-name (expand-file-name org-mobile-directory))))
       (remotepush mce-org-mobpush-remote))
    (call-process
     (substitute-in-file-name mce-org-mobpush-tool)
     nil "*mce-org-mobpush*" nil "-r" localpush remotepush)))

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
(excorporate)
(excorporate-diary-enable)
(defun mce/agenda-update-diary ()
  "call excorporate to update the diary for today"
  (exco-diary-diary-advice (calendar-current-date) (calendar-current-date) #'message "diary updated"))

(add-hook 'org-agenda-cleanup-fancy-diary-hook 'mce/agenda-update-diary)
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
