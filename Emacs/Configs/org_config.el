;; === Start >> Setup org-mode TODO actions ===
(setq load-path (cons "~/.InitScripts/Emacs/Plugins/org-mode/lisp" load-path))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; Follow symbolic links when pressing enter or tab
(setq org-return-follows-link t)
(setq org-tab-follows-link t)
;; === End << Setup org-mode TODO actions ===

;; ======= >>> Org mode start =======
;; Remember
(org-remember-insinuate)
(setq org-indent-mode t)
(setq org-hide-leading-stars t)
(setq org-directory "~/Documents/GTD/")
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; ======= <<< Org mode end ===========

;; ======= <<< Bind Pomodoro technique with Org-mode ======
(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)
(add-hook 'org-clock-in-hook '(lambda ()
																(if (not org-timer-current-timer)
																		(org-timer-set-timer '(16)))))

;; Now org-clock-in

;; ======= <<< Pomodoro end ===========


;; Add Google weather to Org-mod
(require 'google-weather)
(require 'org-google-weather)
