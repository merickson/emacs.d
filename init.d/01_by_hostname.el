;; Host-specific customizations and defaults.

; Defaults.
; TODO: make into per-hostname sometime later.
(setenv "PATH"
	(concat
	 "~/bin" ":"
	 "/usr/local/bin" ":"
	 "/usr/local/sbin" ":"
         "/usr/texbin" ":"
	 (getenv "PATH")))
(setenv "PYTHONPATH"
        (concat
         "/Users/matt/Dev/SpiderOak/pandora" ":"
         "/Users/matt/Dev/SpiderOak/net_kes/lib" ":"
         "/Users/matt/Dev/SpiderOak/pandora-email" ":"
         "/usr/local/lib/python" ":"
         "/usr/lib/python2.7/site-packages" ":"
         (getenv "PYTHONPATH")))

(setq exec-path
      (append '("~/bin"
                "/usr/local/bin"
                "/usr/local/MacGPG2/bin")
              exec-path))

