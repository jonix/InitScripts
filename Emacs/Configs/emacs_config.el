;; This is the configuration load points for the customization of Emacs
;; Make a symbolic link from this file to ~/.emacs
;;
;; To speed up the start time of Emacs, you could byte-compile the .el files
;; in the Plugins directory
;; In a dired buffer of the ~/bin/emacslib
;; directory, mark the .el files with 'M' and then byte-compile them with  'B'.

;; This .emacs resource loooks interesting, take bit and pieces
;; http://en.wikipedia.org/wiki/User:Gwern/.emacs


;; To keep custom variables in their own file
;; via the customize interface (M-x customize*)
(setq custom-file "~/.InitScripts/Emacs/Configs/custom_ui_configs.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins")
(setq bookmark-default-file "~/.InitScripts/Emacs/Configs/bookmarks.bmk")

;; Disable the Toolbar
(tool-bar-mode -1)

;; Preserve the owner and group of the file you're editing
(setq backup-by-copying-when-mismatch t)

;; Disable Lisp debugging mode
(setq debug-on-error nil)

;; Disable Ctrl+x, Ctrl+c, and other "standardized" keyboard shortcuts for copy and paste text. Why? Because Ctrl+x is used in many key combinations.
(cua-mode nil)


;; Let long lines disapear out into the right margin
(setq-default truncate-lines t)
;; truncate even even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)

;; Open file recursively
(require 'find-recursive)

;; Auto byte-compile lisp plugins
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; Ensure the cursor is top/bottom most when scrolling, I.E the mouse reaches top/bottom of the document
(require 'fscroll)

;; Add scratch buffer with previous selected mode active
(autoload 'scratch "scratch" nil t)

;; The startup screen is annoying.
(setq inhibit-startup-message t)

;; Start with an empty scratch buffer
(setq initial-scratch-message nil)

;; Prevent Emacs from making backup files
(setq make-backup-files nil)

;; Change buffer does not fail if in mini-buffer
;; (setq enable-recursive-minibuffers t)

;; Disable minimizing Emacs with CTRL+z
(global-set-key "\C-z" nil)

;; Ignore file case when opening file / changing buffers
;; read-file-name-completion-ignore-case overrides completion-ignore-case
;; read-buffer-completion-ignore-case overides completion-ignore-case

;; For disabling pc speaker beeps. Flashes instead
(setq visible-bell t)

;; Enable Mac OS X Antialiasing fonts
;; Seems to be defaulted to non-nil
;; (setq ns-antialias-text t)

;; Remove prompt that forces full “yes” or “no” when "y" or "no" suffice.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Advanced option to view only a sub-section of a buffer
(put 'narrow-to-region 'disabled nil)


;; For using the built-in clipboard provided by the OS
(setq menu-bar-enable-clipboard t)

; Deleting files goes to OS's trash folder
(setq delete-by-moving-to-trash t)

; Kill the line including the new line character
(setq kill-whole-line t)

;; Set up browse-kill-ring.  M-y invokes browse-kill-ring.
;;(require 'browse-kill-ring+)
;;(browse-kill-ring-default-keybindings)


; Try to have wordboundary on seperate lines (don't cut words in half)
; (global-visual-line-mode 1)

;; For smooth scrolling
;; (require 'smooth-scrolling)

;; Show time in status bar.
(setq european-calendar-style t)
(display-time)

;; Start Emacs in Daemon mode. If you have run Emacs once a daemon is started in the background which all other Emacs is connected to, hence a much faster startup time
;; (server-start)

;; Follow the ouput from Compilation buffer
;; (setq compilation-scroll-output t)
;; Follow the output from Compilation buffer until first error appears
(setq compilation-scroll-output 'first-error)

;; For easier navigation between multiple visible windows
;; Use meta-arrow keys for simulating CTRL+o
(windmove-default-keybindings 'meta)

;; Let M-x shell show correct colors when working with shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Setup aliases for M-x functions
(load-file "~/.InitScripts/Emacs/Configs/aliases.el")

;; Setup TAB config
(load-file "~/.InitScripts/Emacs/Configs/tab_config.el")

;; Setup recent file config
(load-file "~/.InitScripts/Emacs/Configs/recent_file_config.el")

;; Setup recent file config
(load-file "~/.InitScripts/Emacs/Configs/whitespace_config.el")

;; Setup C++ mode
(load-file "~/.InitScripts/Emacs/Configs/cpp_mode.el")
;;(load-file "~/.InitScripts/Emacs/Configs/cedet_mode.el")
;; (load-file "~/.InitScripts/Emacs/Configs/cedet_mode_2.el")
;; (load-file "~/.InitScripts/Emacs/Configs/new_cedet_mode.el")

;; Setup GPG mode
(load-file "~/.InitScripts/Emacs/Configs/gpg_config.el")

;; Setup Org-mode
(load-file "~/.InitScripts/Emacs/Configs/org_config.el")

;; Setup ReStructuredText-mode (rst)
(load-file "~/.InitScripts/Emacs/Configs/rst_mode.el")

;; Setup Rich text format-mode (rtf)
(load-file "~/.InitScripts/Emacs/Configs/rtf_mode.el")

;; Setup Ruby-mode
(load-file "~/.InitScripts/Emacs/Configs/ruby_config.el")

;; Setup CSS-mode
(load-file "~/.InitScripts/Emacs/Configs/css_mode.el")

;; Setup PHP-mode
(load-file "~/.InitScripts/Emacs/Configs/php_mode.el")

;; Setup CSS-mode
(load-file "~/.InitScripts/Emacs/Configs/perl_mode.el")

;; Setup spell checking
(load-file "~/.InitScripts/Emacs/Configs/spellchecking_config.el")

;; Setup Service lookup
(load-file "~/.InitScripts/Emacs/Configs/service_lookup.el")

;; Setup Bookmark support
(load-file "~/.InitScripts/Emacs/Plugins/bookmark_cycling.el")

;; Setup Folding support
(load-file "~/.InitScripts/Emacs/Configs/folding_support.el")

;; Setup speedbar config
(load-file "~/.InitScripts/Emacs/Configs/speedbar_config.el")

;; Setup syntax highlighting
(load-file "~/.InitScripts/Emacs/Configs/highlighting_config.el")

;; Setup common keyboard shortcuts
(load-file "~/.InitScripts/Emacs/Configs/keybindings_config.el")



;; Let the calendar start the weeks on monday
;; (setq calendar-week-start-day 1) ;; as opposed to 0 (sunday)

;; Show week numbers in Calendar
(setq calendar-week-start-day 1
      calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'font-lock-function-name-face))


;; move cursor one line when going past end of page
(setq scroll-step 1)

;; something else that should make scrolling nicer
(setq scroll-conservatively 1)

;; This might only be necessary on Mac OS X
;; Note: Scrollbars on OS X is relative to the amount of scrolling (bottom of document is a very small scrollbar)
(when window-system
  (mwheel-install))

;; Load WinnerMode, a global minor mode that allows undo and redo of
;; window configuration with commands 'C-c left' and 'C-c right'.
(winner-mode 1)


;; For transparancy
;; (set-frame-parameter (selected-frame) 'alpha 70)

;; Add support for Cups printing
(setq lpr-command "xpp")

;; Add support for Ack (a better grep)
(require 'ack)

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

;; Improving M-x similar to IDO enhances Open File mechanism
(require 'smex)
(smex-initialize)

;; Emulate some things from Textmate
(require 'textmate)
(textmate-mode)

;; For YASnippet (TextMate like snippets, think "cl+<Tab>" for a full C++ class definition)
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.InitScripts/Emacs/Plugins/yasnippet/snippets")


;; For IDO (Improved buffer switching, much like TextMate ALT+T fuzzy matching) (Ovverides C-x C-f and C-x b)
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-extensions t)
(ido-mode t)

;; Added support for highlighting FIXME in code comments
(require 'fic-mode)
(add-hook 'c++-mode-hook 'turn-on-fic-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-fic-mode)

;; For box quoting
(require 'boxquote)

;; Show a silly thinking bubble with the selected text
(autoload 'thinks "thinks" "Wraps the selected text in a thinking bubble" t)
;; (require 'thinks)

;; Add support for encode (obfuscate) to a URL path to contain % characters
(autoload 'obfuscate-url "obfusurl" "Obfuscate URL under point" t)

;; For Git commands
;;(load-file "~/.InitScripts/Emacs/Plugins/sourcepair.el")
;;(require 'magit)
(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins")
(require 'magit)
(require 'git)
(require 'git-blame)


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


;; (load "~/.InitScripts/Emacs/Plugins/icicles-install")
(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/icicles")
(require 'icicles)

;; Automatically load TAGS file
(require 'etags-table)

;; Put etags information in bookmark
;; (defun ivan-etags-bookmark ()
;;  (bookmark-set tagname))
;;(add-hook 'find-tag-hook 'ivan-etags-bookmark)

;; ========================================================
;; Override add-ons fixation on setting debug mode


;; ;; Disable Quit Emacs
;; (defun dont-kill-emacs()
;;   (interactive)
;;   (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
;; (global-set-key "\C-x\C-c" 'dont-kill-emacs)

;; In dired mode, go up to parent directory by pressing backspace
(define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)
;; Revert dired lists on revisiting them
(setq dired-auto-revert-buffer t)
(put 'dired-find-alternate-file 'disabled nil)

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


