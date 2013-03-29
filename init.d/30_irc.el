(require 'tls)
(require 'todochiku)
(require 'erc-join)
(erc-autojoin-mode 1)
(autoload 'erc "erc" "" t)

(defun mce-growl-at-me (match-type nick message)
  (unless (posix-string-match "^\\** *Users on #" message)
    (todochiku-message (concat "ERC: " (buffer-name (current-buffer)))
                       (concat (replace-regexp-in-string "!.*" "" nick) 
                               ": "
                               message)
                       (todochiku-icon 'irc))))

(defmacro make-erc-connect (command server port nick password)
  "Create interactive command 'command' for connecting to an IRC server."
  (fset command
        `(lambda ()
           (interactive)
           (erc-tls :server ,server :port ,port :nick ,nick :password ,password))))

(make-erc-connect so-irc 
                  (netrc-get mce-netrc-sochat "machine")
                  mce-irc-port
                  (netrc-get mce-netrc-sochat "login")
                  (netrc-get mce-netrc-sochat "password"))


(if (boundp 'erc-autojoin-channels-alist)
    (dolist (elt mce-irc-privservers)
      (add-to-list 'erc-autojoin-channels-alist elt))
  (setq erc-autojoin-channels-alist mce-irc-privservers))

(add-hook 'erc-mode-hook 'flyspell-mode)
(add-hook 'erc-text-matched-hook 'mce-growl-at-me)
