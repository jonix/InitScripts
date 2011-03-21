;; ==== >>> Folding support start =====
(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
			 (unless selective-display
				 (1+ (current-column))))))

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
			(if (condition-case nil
							(hs-toggle-hiding)
						(error t))
					(hs-show-all))
		(toggle-selective-display column)))

(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key [C-kp-add] 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'php-mode-hook        'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
;; ===== <<< Folding end =======
