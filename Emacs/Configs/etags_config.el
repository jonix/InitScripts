;; Let TAGS be friendlier if there is overloaded functions
(require 'etags-select)

;; Update the selected TAGS file everytime you save a defined file
;; Note: You need to visit-tags-table for this to function
(require 'etags-update)

;; Auto load existing TAGS file if you visit a file within the same folder
(setq tags-file-name "TAGS")

;; Automatically load TAGS file
(require 'etags-table)

;; Put etags information in bookmark
;; (defun ivan-etags-bookmark ()
;;  (bookmark-set tagname))
;;(add-hook 'find-tag-hook 'ivan-etags-bookmark)
