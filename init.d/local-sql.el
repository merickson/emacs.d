;; SQL customizations
(eval-after-load "sql"
  '(progn
     (sql-set-product 'postgres)
  ))
