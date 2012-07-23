(require 'tls)
(require 'netrc)

(when window-system
  (eval-after-load 'rcirc '(require 'rcirc-color)))

(rcirc-track-minor-mode 1)

;; Turn on flyspell-mode for rcirc.
(add-hook 'rcirc-mode-hook (lambda ()
                             (flyspell-mode 1)))

(when (boundp 'mce-irc-spideroak-alist)
  (setq rcirc-server-alist (list mce-irc-spideroak-alist)))

;; (add-to-list 'rcirc-server-alist
;;              '(mce-irc-spideroaknet
;;                :nick "MattE"
;;                :port mce-irc-port
;;                :channels mce-irc-spideroakchannel-alist))

;; Keep the prompt at the bottom of the window.
(add-hook 'rcirc-mode-hook
          (lambda ()
            (set (make-local-variable 'scroll-conservatively)
                 8192)))

;;;;;;
;;;;;; Auto-reconnect Logic
;;;;;; From http://www.emacswiki.org/emacs/rcircReconnect
;;;;;;
(defun-rcirc-command reconnect (arg)
  "Reconnect the server process."
  (interactive "i")
  (if (buffer-live-p rcirc-server-buffer)
      (with-current-buffer rcirc-server-buffer
	(let ((reconnect-buffer (current-buffer))
	      (server (or rcirc-server rcirc-default-server))
	      (port (if (boundp 'rcirc-port) rcirc-port rcirc-default-port))
	      (nick (or rcirc-nick rcirc-default-nick))
	      channels)
	  (dolist (buf (buffer-list))
	    (with-current-buffer buf
	      (when (equal reconnect-buffer rcirc-server-buffer)
		(remove-hook 'change-major-mode-hook
			     'rcirc-change-major-mode-hook)
                (let ((server-plist (cdr (assoc-string server rcirc-server-alist)))) 
                  (when server-plist 
                    (setq channels (plist-get server-plist :channels))))
		  )))
	  (if process (delete-process process))
	  (rcirc-connect server port nick
			 nil
			 nil
			 channels)))))

;;; Attempt reconnection at increasing intervals when a connection is
;;; lost.

(defvar rcirc-reconnect-attempts 0)

;;;###autoload
(define-minor-mode rcirc-reconnect-mode
  nil
  nil
  " Auto-Reconnect"
  nil
  (if rcirc-reconnect-mode
      (progn
	(make-local-variable 'rcirc-reconnect-attempts)
	(add-hook 'rcirc-sentinel-hooks
		  'rcirc-reconnect-schedule nil t))
    (remove-hook 'rcirc-sentinel-hooks
		 'rcirc-reconnect-schedule t)))

(defun rcirc-reconnect-schedule (process &optional sentinel seconds)
  (condition-case err
      (when (and (eq 'closed (process-status process))
		 (buffer-live-p (process-buffer process)))
	(with-rcirc-process-buffer process
	  (unless seconds
	    (setq seconds (exp (1+ rcirc-reconnect-attempts))))
	  (rcirc-print
	   process "my-rcirc.el" "ERROR" rcirc-target
	   (format "scheduling reconnection attempt in %s second(s)." seconds) t)
	  (run-with-timer
	   seconds
	   nil
	   'rcirc-reconnect-perform-reconnect
	   process)))
    (error
     (rcirc-print process "RCIRC" "ERROR" nil
		  (format "%S" err) t)))
)

(defun rcirc-reconnect-perform-reconnect (process)
  (when (and (eq 'closed (process-status process))
	     (buffer-live-p (process-buffer process))
	     )
    (with-rcirc-process-buffer process
      (when rcirc-reconnect-mode
	(if (get-buffer-process (process-buffer process))
	    ;; user reconnected manually
	    (setq rcirc-reconnect-attempts 0)
	  (let ((msg (format "attempting reconnect to %s..."
			     (process-name process)
			     )))
	    (rcirc-print process "my-rcirc.el" "ERROR" rcirc-target
			 msg t))
	  ;; remove the prompt from buffers
	  (condition-case err
	      (progn
		(save-window-excursion
		  (save-excursion
		    (rcirc-cmd-reconnect nil)))
		(setq rcirc-reconnect-attempts 0))
	    ((quit error)
	     (incf rcirc-reconnect-attempts)
	     (rcirc-print process "my-rcirc.el" "ERROR" rcirc-target
			  (format "reconnection attempt failed: %s" err)  t)
	     (rcirc-reconnect-schedule process))))))))



(defun mce-make-server-channel-list (server channel-alist)
  "Combines elements from channel-alist and the server"
  (let (value)
    (dolist (element channel-alist value)
      (setq value (cons (list server element) value)))))

;;; Make sure to re-connect to anything on SpiderOak.
(add-hook 'rcirc-mode-hook
          (lambda ()
            (if (string-match (regexp-opt (list mce-irc-spideroaknet))
                              (buffer-name))
                (rcirc-reconnect-mode 1))))
