;; Let TAGS be friendlier if there is overloaded functions
;(require 'etags-select)

;; Update the selected TAGS file everytime you save a defined file
;; Note: You need to visit-tags-table for this to function
;(require 'etags-update)

;; Auto load existing TAGS file if you visit a file within the same folder
;(setq tags-file-name "TAGS")

;; Automatically load TAGS file
;(require 'etags-table)

;; Put etags information in bookmark
;; (defun ivan-etags-bookmark ()
;;  (bookmark-set tagname))
;;(add-hook 'find-tag-hook 'ivan-etags-bookmark)


;; Update tag file automagically
;; Should be done with etags-update
(defadvice find-tag (around refresh-etags activate)
	"Rerun etags and reload tags if tag not found and redo find-tag.
   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
				ad-do-it
      (error (and (buffer-modified-p)
									(not (ding))
									(y-or-n-p "Buffer is modified, save it? ")
									(save-buffer))
						 (er-refresh-etags extension)
						 ad-do-it))))

(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command (format "ctags -e *.%s" (or extension "el")))
  (let ((tags-revert-without-query t))  ; don't query, revert silently
    (visit-tags-table default-directory nil)))
