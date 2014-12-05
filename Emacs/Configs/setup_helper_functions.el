;; Ease the GDB integration
(setq gdb-many-windows t)

;; Improving M-x similar to IDO enhances Open File mechanism
(require 'smex)
(smex-initialize)

;; Emulate some things from Textmate
(require 'textmate)
(textmate-mode)

;; Added support for highlighting FIXME in code comments
(require 'fic-mode)
(add-hook 'c++-mode-hook 'turn-on-fic-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-fic-mode)

;; Add support for Pomodoro
(require 'pomodoro)

;; For Pomodoro
(define-key global-map "\C-ct" 'pomodoro)


;; Add support for encode (obfuscate) to a URL path to contain % characters
(autoload 'obfuscate-url "obfusurl" "Obfuscate URL under point" t)

;; uniquify.el is a helper routine to help give buffer names a better unique name.
(when (load "uniquify" 'NOERROR)
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)
																				; (setq uniquify-buffer-name-style 'post-forward)
	)


;; === >>> Complete anything support =====
;; Add company The package to COMP(lete) ANY(thing)
;; (add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/company")
;; (autoload 'company-mode "company" nil t)
;; ==== <<< Complete anything end ====


;; ==== >>> Ascii Table support =====
(require 'table)
(add-hook 'text-mode-hook 'table-recognize)
;; ==== <<< Ascii Table support end =====

;; ==== >>> Ditaa support (Render ascii to graphics)
(setq ditaa-cmd "java -jar ~/Scripts/ditaa0_9.jar")
(defun ditaa-generate()
  (interactive)
  (shell-command
   (concat ditaa-cmd " " buffer-file-name)))
;; ==== <<< Ditaa support end =========


;; ========================================================
;; Override add-ons fixation on setting debug mode


;; ;; Disable Quit Emacs
;; (defun dont-kill-emacs()
;;   (interactive)
;;   (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
;; (global-set-key "\C-x\C-c" 'dont-kill-emacs)



																				; Open a frame with content from kill-ring
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))


;; Make a window sticky (I.E compilation window does not appear in this window)
(defun toggle-sticky-buffer-window ()
  "Toggle whether this window is dedicated to this buffer."
  (interactive)
  (set-window-dedicated-p
   (selected-window)
   (not (window-dedicated-p (selected-window))))
  (if (window-dedicated-p (selected-window))
      (message "Window is now dedicated.")
    (message "Window is no longer dedicated.")))

;; Show week numbers in Calendar
(setq calendar-week-start-day 1
      calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'font-lock-function-name-face))

;; Load WinnerMode, a global minor mode that allows undo and redo of
;; window configuration with commands 'C-c left' and 'C-c right'.
(winner-mode 1)

;; Add support for Cups printing
(setq lpr-command "xpp")

;; ==== <<<< Copy lines (instead of killing and instantly yanking) ================
(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))

(setq-default kill-read-only-ok t)
(global-set-key "\C-c\C-k" 'copy-line)
;; ==== >>>>> Copy lines (instead of killing and instantly yanking) end ================


;; === <<< Start Disable mouse copying ====
(setq mouse-drag-copy-region nil)
(global-unset-key [mouse-2])
;; === >>> End disable mouse copying ====


;; === <<< Open files with sudo privs start =========
(defun find-alternative-file-with-sudo ()
  "Open current buffer as root!"
	(interactive)
	(when buffer-file-name
		(find-alternate-file
		 (concat "/sudo:root@localhost:"
						 buffer-file-name))))
;; === <<< Open files with sudo privs end =========

;; Let Emacs tell me (at my requests) what and how the previous function were
(defun describe-last-function()
  (interactive)
  (describe-function last-command))

;; === <<< Reindent the copy&pasted code start =======
(defadvice yank (after indent-region activate)
	(when (member major-mode '(c++-mode emacs-lisp-mode python-mode c-mode ruby-mode))
		(unless mark-active
			(exchange-point-and-mark))
		(indent-region (region-beginning) (region-end) nil)
		(goto-char (region-end))))

;; === >>> Reindent the copy&pasted code end =======


;; === <<< To make a new script executable when saving start =========
(add-hook 'after-save-hook
					#'(lambda ()
							(and (save-excursion
										 (save-restriction
											 (widen)
											 (goto-char (point-min))
											 (save-match-data
												 (looking-at "^#!"))))
									 (not (file-executable-p buffer-file-name))
									 (shell-command (concat "chmod u+x " (shell-quote-argument buffer-file-name)))             (message
																																																							(concat "Saved as script: " buffer-file-name)))))
;; === >>> To make a new script executable when saving end =========

(defun revert-all-buffers ()
	"Refreshes all open buffers from their respective files"
	(interactive)
	(let* ((list (buffer-list))
				 (buffer (car list)))
		(while buffer
			(when (and (buffer-file-name buffer)
								 (not (buffer-modified-p buffer)))
				(set-buffer buffer)
				(revert-buffer t t t))
			(setq list (cdr list))
			(setq buffer (car list))))
	(message "Refreshed open files"))

;; Load Mac OS X specific settings
;;(when (boundp 'aquamacs-version)
(load-file "~/.InitScripts/Emacs/Configs/macosx_settings.el")
;;)

;; Setup common keyboard shortcuts
(load-file "~/.InitScripts/Emacs/Configs/keybindings_config.el")

(setq server-use-tcp t)
(server-start)
(put 'fill-paragraph 'disabled t)
