;; Webjump customizations.
;; See http://whattheemacsd.com//my-misc.el-01.html

(eval-after-load "webjump"
  '(add-to-list 'webjump-sites
                '("DuckDuckGo" .
                  [simple-query
                   "duckduckgo.com"
                   "https://duckduckgo.com/?q="
                   ""])))

;; Load up private information
(eval-after-load "webjump"
  '(dolist (elt mce-webjumps)
     (add-to-list 'webjump-sites elt)))


