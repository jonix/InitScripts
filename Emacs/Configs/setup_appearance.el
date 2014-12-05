
;; Change background to black, and default text to gray
(setq default-frame-alist '((background-color . "black")
														(foreground-color . "gray")))


;; Change cursor to white
(set-cursor-color "#ffffff")

;; Tell Emacs to use syntax highlighting
(setq global-font-lock-mode t)
(setq font-lock-mode-maximum-decoration t)
(require 'font-lock)

;; Highlight matching parenthesis () [] {} <> (depending on the mode)
(require 'paren)

;; Disable the Toolbar
(tool-bar-mode -1)

;; Disable Lisp debugging mode
(setq debug-on-error nil)

;; Disable Ctrl+x, Ctrl+c, and other "standardized" keyboard shortcuts for copy and paste text. Why? Because Ctrl+x is used in many key combinations.
(cua-mode nil)

;; Let long lines disapear out into the right margin
(setq-default truncate-lines t)
;; truncate even even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)
;; Enable line numbering in the mode line
(setq line-number-mode t)
;; Enable column numbering in the mode line
(setq column-number-mode t)

;; highlight columns 78 to 80 in some modes
;; (require 'column-marker)
;; (dolist (hook '(emacs-lisp-mode-hook
;;                 cperl-mode-hook
;;                 shell-mode-hook
;;                 text-mode-hook
;;                 change-log-mode-hook
;;                 makefile-mode-hook
;;                 message-mode-hook
;; 								org-mode-hook
;;                 texinfo-mode-hook))
;;   (add-hook hook (lambda ()
;;                    (interactive)
;;                    (column-marker-1 78)
;;                    (column-marker-2 79)
;;                    (column-marker-3 80))))


;; Ensure the cursor is top/bottom most when scrolling, I.E the mouse reaches top/bottom of the document
;;(require 'fscroll) ;; For some reason, this made Emacs hang often when scrolling quickly down to the bottom

;; move cursor one line when going past end of page
(setq scroll-step 1)

;; something else that should make scrolling nicer
(setq scroll-conservatively 1)

;; Add scratch buffer with previous selected mode active
(autoload 'scratch "scratch" nil t)

;; The startup screen is annoying.
(setq inhibit-startup-message t)

;; For disabling pc speaker beeps. Flashes instead
(setq visible-bell t)

;; Start with an empty scratch buffer
(setq initial-scratch-message nil)

;; Remove prompt that forces full “yes” or “no” when "y" or "no" suffice.
(defalias 'yes-or-no-p 'y-or-n-p)

;; For smooth scrolling
;; (require 'smooth-scrolling)

;; Show time in status bar.
(setq european-calendar-style t)
(display-time)

;; Let M-x shell show correct colors when working with shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
