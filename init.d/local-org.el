;; Org-mode customizations.
(require 'org-install)

(setq org-directory "~/org-files")
(setq org-agenda-files (list (concat org-directory "/capture.org")
                             (concat org-directory "/spideroak.org")
                             (concat org-directory "/mylife.org")))

(setq org-log-done t)
(setq org-refile-use-outline-path t)
(setq org-use-fast-todo-selection t)
(org-remember-insinuate)
(setq org-default-notes-file (concat org-directory "/capture.org"))

;; Org capture templates
(setq org-capture-templates
      (quote (("t" "todo" entry (file (concat org-directory "/capture.org"))
               "* TODO %?\n%U\n%a\n  %i" :clock-in t :clock-resume t)
              ("n" "note" entry (file (concat org-directory "capture.org"))
               "* %? :NOTE:\n%U\n%a\n  %i" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
               "* %?\n%U\n  %i" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file (concat org-directory "/capture.org"))
               "* TODO Review %c\n%U\n  %i" :immediate-finish t)
              ("p" "Phone call" entry (file (concat org-directory "/capture.org"))
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t))))

(setq org-link-abbrev-alist
      '(("sotrac" . "https://spideroak.com/pandora/ticket/")
        ("sort"   . "https://spideroak.com/rt/")))

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
  (select-frame-by-Org "Org-Capture")
  (add-hook 'org-capture-mode-hook 'delete-other-windows)
  (org-capture)
  (delete-other-windows))

