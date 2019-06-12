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

(defun buffer-mode-alist ()
  "Returns a list of (<buffer-name> . <major-mode>) pairs."
  (let ((all-buffers (buffer-list))
        (rv nil))
    (while all-buffers
      (let* ((this (car all-buffers))
             (name (buffer-name this)))
        (setq all-buffers (cdr all-buffers))
        (when name
          (setq rv (cons (cons name (with-current-buffer this major-mode)) rv)))))
    rv))

(defun buffers-with-major-mode (the-major-mode)
  "Provides a list of buffers with the given major mode."
  (let ((buffer-alist (buffer-mode-alist))
        (rv nil))
    (while buffer-alist
      (let ((this (car buffer-alist)))
        (setq buffer-alist (cdr buffer-alist))
        (if (eql (cdr this) the-major-mode)
            (setq rv (cons (car this) rv)))))
    (sort rv #'string<)))

(defun save-buffers-with-major-mode (the-major-mode)
  "Saves all buffers with a given major mode."
  (let ((buffer-alist (buffer-mode-alist))
        (rv nil))
    (while buffer-alist
      (let ((this (car buffer-alist)))
        (setq buffer-alist (cdr buffer-alist))
        (if (eql (cdr this) the-major-mode)
            (save-current-buffer
              (set-buffer (car this))
              (save-buffer)))))))

(save-buffers-with-major-mode 'org-mode)
