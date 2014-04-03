;; Set Latex goto next error
;(global-set-key "\C-c\C-e" 'TeX-next-error)
;(global-set-key "\C-cp" 'TeX-previous-error)
;(global-set-key "\C-c\C-p" 'TeX-previous-error)

(defun jonix-add-latex-keys ()
	(local-set-key (kbd "C-c e") 'next-error)
	(local-set-key (kbd "C-c p") 'previous-error)
)
(add-hook 'latex-mode-hook `jonix-add-latex-keys)
