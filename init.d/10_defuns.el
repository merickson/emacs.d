;; other-window goes one way, and I want it to go the other at times.
(defun other-previous-window ()
  (interactive)
  (other-window -1))

(defun file-name-sans-dir-and-extension (fname)
  "Returns the file name without directory or extension."
  (file-name-sans-extension (file-name-nondirectory fname)))

(defun count-args (count)
  (if (eq (condition-case nil
              (forward-sexp)
            (scan-error 'fail)) 'fail)
       (1+ count)
    (if (eq (following-char) ?,)
        (count-args (1+ count))
      (count-args count))))


(defun save-buffer-and-run-command (command)
  "Saves the current buffer and then provides M-! functionality."
  (interactive "sCommand to run: ")
  (save-buffer)
  (shell-command command))

(defun prefix-list-elements (list prefix)
  (let (value)
    (nreverse
     (dolist (element list value)
       (setq value (cons (format "%s%s" prefix element) value))))))

