;; Host-specific customizations and defaults.

; Defaults.
; TODO: make into per-hostname sometime later.
(setenv "PATH"
	(concat
	 "~/bin" ":"
	 "/usr/local/bin" ":"
	 "/usr/local/sbin" ":"
	 (getenv "PATH")))
(setenv "PYTHONPATH"
        (concat
         "/Users/matt/Dev/SpiderOak/pandora" ":"
         "/Users/matt/Dev/SpiderOak/net_kes/lib" ":"
         "/usr/local/lib/python" ":"
         (getenv "PYTHONPATH")))

(setq exec-path
      (append '("~/bin"
                "/usr/local/bin"
                "/usr/local/MacGPG2/bin")
              exec-path))

