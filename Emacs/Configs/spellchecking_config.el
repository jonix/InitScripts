;; fix for Ubuntu 10.10 problem with flyspell (enabling caused an error)
(setq flyspell-issue-welcome-flag nil)

;; Tell Emacs to spell check documents (aspell)
(defun turn-spell-checking-on ()
  "Turn speck-mode or flyspell-mode on."
  ;; (speck-mode 1)
  (flyspell-mode 1)
  )
(add-hook 'text-mode-hook 'turn-spell-checking-on)
(add-hook 'org-mode-hook  'turn-spell-checking-on)
;;(add-hook 'c-mode-common-hook   'hs-minor-mode)
;;(add-hook 'c-mode-common-hook
;;		  (lambda()
;;			(flyspell-prog-mode 1)))
(add-hook 'org-mode-hook
					(lambda()
						(flyspell-mode 1)))

(add-hook 'LaTeX-mode-hook
					(lambda()
						(flyspell-mode 1)))

(add-hook 'c-mode-common-hook
					(lambda()
						(flyspell-prog-mode)))

(add-hook 'php-mode-hook
					(lambda()
						(flyspell-prog-mode)))

(add-hook 'ruby-mode-hook
					(lambda()
						(flyspell-prog-mode)))

(add-hook 'perl-mode-hook
					(lambda()
						(flyspell-prog-mode)))

(add-hook 'javascript-mode-hook
					(lambda()
						(flyspell-prog-mode)))

;; (defun fd-switch-dictionary()
;;   (interactive)
;;      (let* ((dic ispell-current-dictionary)
;; 			(change (if (string= dic "deutsch8") "english" "deutsch8")))
;; 	   (ispell-change-dictionary change)
;;        (message "Dictionary switched from %s to %s" dic change)
;;      )
;; )

;;; FlySpell End ;;;

