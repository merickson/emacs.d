(require 'netrc)
(require 'org2blog)

(setq mce-netrc-pdn
      (netrc-machine (netrc-parse "~/.netrc") "peaweedotnet" t))

(setq org2blog/wp-blog-alist
      '(("peaweedotnet"
	 :url "http://peawee.net/xmlrpc.php"
	 :username (netrc-get mce-netrc-pdn "login")
	 :password (netrc-get mce-netrc-pdn "password")
	 :tags-as-categories nil)))
