;; ReST-related customization.

(add-hook 'rst-mode-hook
          '(lambda ()
             (flyspell-mode)
             (longlines-mode)))
