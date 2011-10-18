;; Fortran customizations
(add-hook 'f90-mode-hook
          '(lambda ()
             (define-key f90-mode-map "\C-c\i"
               'f90-insert-alloc-check)))

(setq auto-mode-alist (append auto-mode-alist (list `("\\.F90$" . f90-mode))))
(setq auto-mode-alist (append auto-mode-alist (list `("\\.FOR$" . fortran-mode))))
(setq auto-mode-alist (append auto-mode-alist (list `("\\.for$" . fortran-mode))))

(defun f90-get-alloc-dims ()
  (save-excursion
    (beginning-of-line)
    (re-search-forward 
     (concat (regexp-quote "allocate(") "[-_[:alnum:]]+" (regexp-quote "(")))
    (count-args 0)))
    
(defun f90-get-alloced-var ()
  (beginning-of-line)
  (buffer-substring-no-properties
   (re-search-forward (regexp-opt '("allocate(" "deallocate(")))
   (- (re-search-forward (regexp-opt '("(" "," ")"))) 1)))

(defun f90-get-stat-var ()
  (beginning-of-line)
  (buffer-substring-no-properties
   (re-search-forward (regexp-quote "stat="))
   (- (re-search-forward (regexp-quote ")")) 1)))

(defun f90-insert-module-stub ()
  "Insert a Fortran 90/95 module stub into the file based on the file name."
  (interactive)
   (let ((modname
          (file-name-sans-dir-and-extension (buffer-file-name))))
     (goto-char (point-min))
     (insert (concat "module " modname "
#include 'fort_assert.h'
  implicit none

contains
"))
     (goto-char (point-max))
     (insert (concat "end module " modname))))

(defun f90-insert-alloc-check ()
  "Check for the correct allocation of a F90/95 allocatable array."
  (interactive)
  (let ((modname
         (file-name-sans-dir-and-extension (buffer-file-name)))
        (alloced-var (f90-get-alloced-var))
        (err-var (f90-get-stat-var)))
    (forward-line)
    (let ((start-marker (point-marker)))
      (insert (concat "if (" err-var " /= 0) then\n"))
      (insert (concat "print *, '" (upcase modname) ": Error allocating " alloced-var ".  Aborting'\n"))
      (insert "stop 2\nend if\n\n")
      (indent-region start-marker (point)))))

(defun f90-check-module-variable-definition (variable-name)
  "Check to see if a variable has been defined in the module"
  (save-excursion
    (save-restriction
      (goto-char (point-min))
      (narrow-to-region 1 (re-search-forward "^[:blank:]*contains[:blank:]*$"))
      (goto-char (point-min))
      (if (eq (re-search-forward 
               (concat "::" "\\s-" variable-name) (point-max) t) nil)
          nil
        t))))
      

(defun f90-check-program-variable-definition (variable-name)
  "Check to see if a variable has been defined in the program or subprogram"
  (save-excursion
    (save-restriction
      (narrow-to-defun)
      (goto-char (point-min))
      (if (eq (re-search-forward 
               (concat "::" "\\s-" variable-name) (point-max) t) nil)
          nil
        t))))

(defun f90-add-variable (type num-dims)
  ;; Build the dimension string.
  (setq dims-string ":")
  (setq dims-count 1)
  (while (< dims-count num-dims)
    (setq dims-string (concat dims-string ",:"))
    (setq dims-count (1+ dims-count)))

  ;; Generate the definition string and indent it properly.
  (insert (concat "\n" type ", dimension(" dims-string "), allocatable :: " variable-name "\n"))
  (forward-line -1)
  (f90-indent-line))
  
(defun f90-add-module-variable-definition (type)
  "Add the variable definition to the module."
  (interactive "MVariable type: ")
  (save-excursion
    (let ((variable-name (f90-get-alloced-var))
          (num-dims (f90-get-alloc-dims)))
      (unless (eq (f90-check-module-variable-definition variable-name) t)
        (goto-char (point-min))
        (re-search-forward "^[:blank:]*contains")
        (forward-line -1)
        (f90-add-variable type num-dims)))))

(defun f90-add-program-variable-definition (type)
  "Add the variable definition to the module."
  (interactive "MVariable type: ")
  (save-excursion
    (let ((variable-name (f90-get-alloced-var))
          (num-dims (f90-get-alloc-dims)))
      (unless (eq (f90-check-program-variable-definition variable-name) t)
        (save-restriction
          (narrow-to-defun)
          (goto-char (point-min))
          (unless (re-search-forward (regexp-quote "intent("))
            (re-search-forward "implicit none"))
          (forward-line 1)       
          (f90-add-variable type num-dims))))))

