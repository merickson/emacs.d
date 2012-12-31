(add-hook 'matlab-mode-hook
          '(lambda ()
             (define-key matlab-mode-map [f5] 'matlab-shell-save-and-go)))
(autoload 'matlab-shell "~/.emacs_libs/modes/matlab.el" "Interactive Matlab mode." t)
(setq matlab-shell-command "/usr/local/bin/matlab")
(setq matlab-shell-command-switches "-nodesktop")
