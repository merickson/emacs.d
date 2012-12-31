;; Coding system maddness

(prefer-coding-system 'utf-8-unix)

; ansi-term is poorly behaved, so we defadvice to fix it.
(defadvice ansi-term (after advise-ansi-term-coding-system)
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

