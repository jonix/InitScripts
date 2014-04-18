(require 'gtags)

(defun gtags-root-dir ()
	"Returns GTAGS root directory or nil if doesn't exist."
	(with-temp-buffer
		(if (zerop (call-process "global" nil t nil "-pr"))
				(buffer-substring (point-min) (1- (point-max)))
			nil)))

(defun gtags-update ()
	"Make GTAGS incremental update"
	(call-process "global" nil nil nil "-u"))

(defun gtags-update-hook ()
	(when (gtags-root-dir)
		(gtags-update)))

(add-hook 'after-save-hook #'gtags-update-hook)

;; Cycling TAG hits
(defun ww-next-gtag ()
  "Find next matching tag, for GTAGS."
  (interactive)
  (let ((latest-gtags-buffer
         (car (delq nil  (mapcar (lambda (x) (and (string-match "GTAGS SELECT" (buffer-name x)) (buffer-name x)) )
                                 (buffer-list)) ))))
    (cond (latest-gtags-buffer
           (switch-to-buffer latest-gtags-buffer)
           (forward-line)
           (gtags-select-it nil))
          ) ))
