(require 'erc-match)
(require 'tls)
(require 'netrc)


;; Various and sundry options.
(setq erc-keywords '("@ALL"))
(erc-match-mode t)

(setq erc-echo-notices-in-minibuffer-flag t)
(erc-scrolltobottom-mode)
(erc-track-mode)

;; nick unique highlighting
(and
 (require 'erc-highlight-nicknames)
 (add-to-list 'erc-modules 'highlight-nicknames)
 (erc-update-modules))

(defun mce-make-server-channel-list (server channel-alist)
  "Combines elements from channel-alist and the server"
  (let (value)
    (dolist (element channel-alist value)
      (setq value (cons (list server element) value)))))

(setq erc-autojoin-channels-alist
      (mce-make-server-channel-list 
       mce-irc-spideroaknet mce-irc-spideroakchannel-alist))

(defmacro de-erc-connect (command server port nick pass)
  "Create interactive command for connecting to an IRC server.  The
   command uses interactive mode if passed an argument."
  (fset command
        `(lambda (arg)
           (interactive "p")
           (if (not (= 1 arg))
               (call-interactively 'erc)
             (erc-tls :server ,server :port ,port :nick ,nick :password ,pass)))))

(autoload 'erc "erc" "" t)
(de-erc-connect erc-so 
                (netrc-get mce-netrc-sochat "machine")
                mce-irc-soport
                (netrc-get mce-netrc-sochat "login")
                (netrc-get mce-netrc-sochat "password"))
