;; Host-specific customizations and defaults.

; Defaults.
; TODO: make into per-hostname sometime later.
(setenv "PATH"
	(concat
	 "~/bin" ":"
	 "/usr/local/bin" ":"
	 "/usr/local/sbin" ":"
	 (getenv "PATH")))

(setq exec-path
      (append '("~/bin"
                "/usr/local/bin"
                "/usr/local/MacGPG2/bin")
              exec-path))

