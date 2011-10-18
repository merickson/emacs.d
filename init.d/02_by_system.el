;; System-specific customizations.

(case window-system
  ('ns
   (setq ns-command-modifier 'meta)
   (setq ns-alternate-modifier 'none)))
