;;; Go customizations.

(require 'go-mode)

;; Make sure we run go fmt as we save.
(add-hook 'before-save-hook 'gofmt-before-save)

;; Yay flymake!
(add-to-list 'load-path "$GOPATH/src/github.com/dougm/goflymake")
(require 'go-flymake)
