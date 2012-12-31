;; Webjump customizations.
;; See http://whattheemacsd.com//my-misc.el-01.html

(eval-after-load "webjump"
  '(add-to-list 'webjump-sites
                '("DuckDuckGo" .
                  [simple-query
                   "duckduckgo.com"
                   "https://duckduckgo.com/?q="
                   ""])))
