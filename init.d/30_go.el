;;; Go customizations.

(require 'go-mode)

;; Make sure we run go fmt as we save.
(add-hook 'before-save-hook 'gofmt-before-save)

;; Yay flymake!
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
(require 'go-flymake)

(defun mce-go-funcall-err-returnp ()
  "Determines if there's an err variable returned by the function call under point."
  (save-excursion
    (beginning-of-line)
    (re-search-forward (regexp-quote "err :="))))

(defun mce-go-insert-errcatch ()
  "If there's a variable named 'err' in the return from a golang funcall, insert boilerplate error checking"
  (interactive)
  (when (mce-go-funcall-err-returnp)
    (forward-line)
    (let ((start-marker (point-marker)))
      (insert "if err != nil {\n\n}\n")
      (indent-region start-marker (point))
      (forward-line -2)
      (indent-according-to-mode))))
