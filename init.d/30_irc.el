(require 'tls)
(require 'todochiku)

(defun mce-growl-at-me (match-type nick message)
  (unless (posix-string-match "^\\** *Users on #" message)
    (todochiku-message (concat "ERC: " (buffer-name (current-buffer)) ": " nick)
                       message
                       (todochiku-icon 'irc))))

(add-hook 'erc-text-matched-hook 'mce-growl-at-me)

