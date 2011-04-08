;; For IDO (Improved buffer switching, much like TextMate ALT+T fuzzy matching) (Ovverides C-x C-f and C-x b)
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-extensions t)
(ido-mode t)

;; Letting IDO complete files within a TAGS file
;; Setting TAGS file in the root project directory, may give me a "project management" system
(defun ido-find-file-in-tag-files ()
	(interactive)
	(save-excursion
		(let ((enable-recursive-minibuffers t))
			(visit-tags-table-buffer))
		(find-file
		 (expand-file-name
			(ido-completing-read
			 "Project file: " (tags-table-files) nil t)))))
