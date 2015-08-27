;; Host-specific customizations and defaults.

; Defaults.
; TODO: make into per-hostname sometime later.
(setenv "PYTHONPATH"
        (concat
         "/Users/matt/Dev/SpiderOak/pandora" ":"
         "/Users/matt/Dev/SpiderOak/net_kes/netkes" ":"
         "/Users/matt/Dev/SpiderOak/pandora-email" ":"
         "/usr/local/lib/python" ":"
         "/usr/lib/python2.7/site-packages" ":"
         (getenv "PYTHONPATH")))

