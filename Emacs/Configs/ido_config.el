;; For IDO (Improved buffer switching, much like TextMate ALT+T fuzzy matching) (Ovverides C-x C-f and C-x b)
(require 'ido)
(ido-mode t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-extensions t) ;;; Ignore files defined in variable completion-ignored-extensions
(setq ido-create-new-buffer 'always) ; If a buffer name that doesn't exist is
																				; chosen, just make a new one without
																				; prompting





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

;;; Order extensions by how I use them
(setq ido-file-extensions-order '(".tex"  ".txt" ".py" ".sh" ".el" ".xml" ".htm"))

;;; Default keybinding is backspace key, but I use C-w in the non-Ido-mode
;;; minibuffers often, so this is more conventient for muscle memory
(define-key ido-file-completion-map (kbd "C-w") 'ido-delete-backward-updir)

;;; Allow spaces when using ido-find-file
(add-hook 'ido-make-file-list-hook
          (lambda ()
            (define-key ido-file-dir-completion-map (kbd "SPC") 'self-insert-command)))


;;; Stops Ido searching for similar-named files if I use C-x C-s to create a new
;;; file and buffer
(setq ido-auto-merge-work-directories-length -1)

;;; Keep annoying buffers out of my face
(setq ido-ignore-buffers (list (rx (or (and bos  " ")
                                       (and bos
                                            (or "*Completions*"
                                                "*Shell Command Output*"
                                                "*vc-diff*")
                                            eos)))))



; sort ido filelist by mtime instead of alphabetically
(add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
(add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
(defun ido-sort-mtime ()
	(setq ido-temp-list
				(sort ido-temp-list
							(lambda (a b)
								(time-less-p
								 (sixth (file-attributes (concat ido-current-directory b)))
								 (sixth (file-attributes (concat ido-current-directory a)))))))
	(ido-to-end  ;; move . files to end (again)
	 (delq nil (mapcar
							(lambda (x) (and (char-equal (string-to-char x) ?.) x))
							ido-temp-list))))



;; Find File At Pointo
(setq ido-use-filename-at-point 'guess)