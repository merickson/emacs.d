;; System-specific customizations.

(case window-system
  ('ns
   (setq ns-command-modifier 'meta)
   (setq ns-alternate-modifier 'none)))

(if (string= system-type "windows-nt")
    (progn (setq mce-so-hive "~/Documents/SpiderOak Hive/")
	   (setq mce-dropbox (concat (getenv "USERPROFILE") "/Dropbox/")))
  (progn (setq mce-so-hive "~/SpiderOak Hive/")
         (setq mce-dropbox "~/Dropbox/")))

(if (string= system-type "darwin")
    (progn (setenv "PATH"
                   (shell-command-to-string "launchctl getenv PATH"))
           (exec-path-from-shell-copy-env "PATH")))


