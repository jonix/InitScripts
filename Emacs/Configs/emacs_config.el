;; This is the configuration load points for the customization of Emacs
;; Make a symbolic link from this file to ~/.emacs
;;
;; To speed up the start time of Emacs, you could byte-compile the .el files
;; in the Plugins directory
;; In a dired buffer of the ~/bin/emacslib
;; directory, mark the .el files with 'M' and then byte-compile them with  'B'.

;; This .emacs resource loooks interesting, take bit and pieces
;; http://en.wikipedia.org/wiki/User:Gwern/.emacs


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Very important initial settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; To keep custom variables in their own file
;; via the customize interface (M-x customize*)
(setq custom-file "~/.InitScripts/Emacs/Configs/custom_ui_configs.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins")
(setq bookmark-default-file "~/.InitScripts/Emacs/Configs/bookmarks.bmk")

;; Add Emacs new package management system
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Appearance customization
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Change background to black, and default text to gray
(setq default-frame-alist '((background-color . "black")
	(foreground-color . "gray")))


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Misc core functionality
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable auto-complete
(load-file "~/.InitScripts/Emacs/Configs/auto-complete_config.el")

;; Preserve the owner and group of the file you're editing
(setq backup-by-copying-when-mismatch t)

;; Change buffer does not fail if in mini-buffer
;; (setq enable-recursive-minibuffers t)

;; Ignore file case when opening file / changing buffers
;; read-file-name-completion-ignore-case overrides completion-ignore-case
;; read-buffer-completion-ignore-case overides completion-ignore-case

;; Open file recursively
(require 'find-recursive)

;; Use `find` with dired
(require 'find-dired)
;; Make find-dired faster
(setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld"))

;; Auto byte-compile lisp plugins
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; Prevent Emacs from making backup files
(setq make-backup-files nil)

;; Disable minimizing Emacs with CTRL+z
(global-set-key "\C-z" nil)

;; Let URL at mouse point be clickable
(global-set-key [S-mouse-2] 'browse-url-at-mouse)

;; Advanced option to view only a sub-section of a buffer
(put 'narrow-to-region 'disabled nil)

;; For using the built-in clipboard provided by the OS
(setq menu-bar-enable-clipboard t)
(setq x-select-enable-clipboard t)
;; This line causes problems with MacOS X and Emacs 24
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq interprogram-paste-function 'x-selection-value)

;; Deleting files goes to OS's trash folder
(setq delete-by-moving-to-trash t)

;; Kill the line including the new line character
(setq kill-whole-line t)

;; Set up browse-kill-ring.  M-y invokes browse-kill-ring.
;;(require 'browse-kill-ring+)
;;(browse-kill-ring-default-keybindings)


; Try to have wordboundary on seperate lines (don't cut words in half)
; (global-visual-line-mode 1)

;; Start Emacs in Daemon mode. If you have run Emacs once a daemon is started in the background which all other Emacs is connected to, hence a much faster startup time
;; (server-start)

;; Follow the ouput from Compilation buffer
;; (setq compilation-scroll-output t)
;; Follow the output from Compilation buffer until first error appears
(setq compilation-scroll-output 'first-error)

;; For easier navigation between multiple visible windows
;; Use meta-arrow keys for simulating CTRL+o
(windmove-default-keybindings 'meta)

;; Let the calendar start the weeks on monday
;; (setq calendar-week-start-day 1) ;; as opposed to 0 (sunday)

;; In dired mode, go up to parent directory by pressing backspace
(define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)

;; Revert dired lists on revisiting them
(setq dired-auto-revert-buffer t)
(put 'dired-find-alternate-file 'disabled nil)

;; Advanced paren-matching (including custom paired delimeter)
(require 'mic-paren)
(paren-activate)
(add-hook 'LaTeX-mode-hook
					(function (lambda ()
											(paren-toggle-matching-quoted-paren 1)
											(paren-toggle-matching-paired-delimiter 1))))
(add-hook 'c-mode-common-hook
					(function (lambda ()
											(paren-toggle-open-paren-context 1))))


;; Search word at point
;;;
;; Move to beginning of word before yanking word in isearch-mode.
;; Make C-s C-w and C-r C-w act like Vim's g* and g#, keeping Emacs'
;; C-s C-w [C-w] [C-w]... behaviour.
(require 'thingatpt)

(defun my-isearch-yank-word-or-char-from-beginning ()
  "Move to beginning of word before yanking word in isearch-mode."
  (interactive)
  ;; Making this work after a search string is entered by user
  ;; is too hard to do, so work only when search string is empty.
  (if (= 0 (length isearch-string))
      (beginning-of-thing 'word))
  (isearch-yank-word-or-char)
  ;; Revert to 'isearch-yank-word-or-char for subsequent calls
  (substitute-key-definition 'my-isearch-yank-word-or-char-from-beginning
			     'isearch-yank-word-or-char
			     isearch-mode-map))

(add-hook 'isearch-mode-hook
 (lambda ()
   "Activate my customized Isearch word yank command."
   (substitute-key-definition 'isearch-yank-word-or-char
			      'my-isearch-yank-word-or-char-from-beginning
			      isearch-mode-map)))

;; Copy "things" at point
(require 'thing-edit)
(load-file "~/.InitScripts/Emacs/Configs/thing-edit_keybindings.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Behaviour configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Setup flsypell
(load-file "~/.InitScripts/Emacs/Configs/flyspell-config.el")
(load-file "~/.InitScripts/Emacs/Configs/flyspell-keybindings.el")


;; Setup aliases for M-x functions
(load-file "~/.InitScripts/Emacs/Configs/aliases.el")

;; Setup TAB key config
(load-file "~/.InitScripts/Emacs/Configs/tab_config.el")

;; Setup recent file config
(load-file "~/.InitScripts/Emacs/Configs/recent_file_config.el")

;; Setup whitespace file config
(load-file "~/.InitScripts/Emacs/Configs/whitespace_config.el")

;; Setup GPG mode
(load-file "~/.InitScripts/Emacs/Configs/gpg_config.el")

;; Setup spell checking
(load-file "~/.InitScripts/Emacs/Configs/spellchecking_config.el")

;; Setup Service lookup
(load-file "~/.InitScripts/Emacs/Configs/service_lookup.el")

;; Setup Bookmark support
(load-file "~/.InitScripts/Emacs/Plugins/bookmark_cycling.el")
(load-file "~/.InitScripts/Emacs/Configs/bookmark_keybindings.el")

;; Setup Folding support
(load-file "~/.InitScripts/Emacs/Configs/folding_support.el")

;; Setup speedbar config
(load-file "~/.InitScripts/Emacs/Configs/speedbar_config.el")

;; Setup general project mode
(load-file "~/.InitScripts/Emacs/Configs/projectile_config.el")

;; Golden Ratio
;;(load-file "~/.InitScripts/Emacs/Configs/goldenratio_config.el")

;; Play Music from within Emacs using Emms
(load-file "~/.InitScripts/Emacs/Configs/multimedia_config.el")
(load-file "~/.InitScripts/Emacs/Configs/multimedia_keybindings.el")

;; Setup TAG file support
(load-file "~/.InitScripts/Emacs/Configs/etags_config.el")
;(load-file "~/.InitScripts/Emacs/Configs/gtags_config.el")
;(load-file "~/.InitScripts/Emacs/Configs/gtags_keybindings.el")


;; Setup Grep replacement
(load-file "~/.InitScripts/Emacs/Configs/ack_config.el")

;; Setup GIT support
(load-file "~/.InitScripts/Emacs/Configs/git_config.el")

;; Setup IDO support. Improved buffer switching, much like TextMate ALT+T fuzzy matching
;; (Ovverides C-x C-f and C-x b)
(load-file "~/.InitScripts/Emacs/Configs/ido_config.el")

;; Setup Icicles support
;; (load-file "~/.InitScripts/Emacs/Configs/icicles_config.el")

;; Setup Insert date support
(load-file "~/.InitScripts/Emacs/Configs/date_config.el")

;; Setup predictive system for faster input
;; No worky under Aquamacs
(load-file "~/.InitScripts/Emacs/Configs/predictive_config.el")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Language support
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setup syntax highlighting
(load-file "~/.InitScripts/Emacs/Configs/highlighting_config.el")

;; Setup Python
(load-file "~/.InitScripts/Emacs/Configs/python_config.el")

;; Setup Java
(load-file "~/.InitScripts/Emacs/Configs/java_config.el")


;; Setup C++ mode
(load-file "~/.InitScripts/Emacs/Configs/cpp_mode2.el")
;; (load-file "~/.InitScripts/Emacs/Configs/cpp_mode.el")
;; (load-file "~/.InitScripts/Emacs/Configs/cedet_mode.el")
;; (load-file "~/.InitScripts/Emacs/Configs/cedet_mode_2.el")
;; (load-file "~/.InitScripts/Emacs/Configs/new_cedet_mode.el")
(load-file "~/.InitScripts/Emacs/Configs/cpp_keybindings.el")

;; Setup CMake-mode
(load-file "~/.InitScripts/Emacs/Configs/cmake_mode.el")

;; Setup Scons/Waf-mode
(load-file "~/.InitScripts/Emacs/Configs/waf_mode.el")

;; Setup Org-mode
(load-file "~/.InitScripts/Emacs/Configs/org_config.el")
(load-file "~/.InitScripts/Emacs/Configs/org_keybindings.el")

;; Setup Remember
(load-file "~/.InitScripts/Emacs/Configs/remember_config.el")

;; Setup Pomodoro-mode
;;(load-file "~/.InitScripts/Emacs/Configs/pomodoro_mode.el")

;; Setup ReStructuredText-mode (rst)
(load-file "~/.InitScripts/Emacs/Configs/rst_mode.el")

;; Setup Rich text format-mode (rtf)
(load-file "~/.InitScripts/Emacs/Configs/rtf_mode.el")

;; Setup Ruby-mode
(load-file "~/.InitScripts/Emacs/Configs/ruby_config.el")

;; Setup Perl-mode
(load-file "~/.InitScripts/Emacs/Configs/perl_mode.el")

;; Setup Arduino-mode
(load-file "~/.InitScripts/Emacs/Configs/arduino_mode.el")

;; Setup CSS-mode
(load-file "~/.InitScripts/Emacs/Configs/css_mode.el")

;; Setup PHP-mode
(load-file "~/.InitScripts/Emacs/Configs/php_mode.el")
(load-file "~/.InitScripts/Emacs/Configs/php_keybindings.el")

;; Setup Latex mode
(load-file "~/.InitScripts/Emacs/Configs/latex_mode.el")
(load-file "~/.InitScripts/Emacs/Configs/latex_keybindings.el")

;; Setup XML-mode
(load-file "~/.InitScripts/Emacs/Configs/xml_mode.el")

;; Setup XHTML-mode
;; This is already included in Emacs 23
;;(load-file "~/.InitScripts/Emacs/Configs/nxhtml_mode.el")

;; Setup Javascript-mode
(load-file "~/.InitScripts/Emacs/Configs/js_mode.el")

;; Setup for Ruby and Ruby On Rails


;; Setup YASnipppet support
;; Setup Javascript-mode
(load-file "~/.InitScripts/Emacs/Configs/yasnippets_config.el")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Game and fun
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.InitScripts/Emacs/Configs/2048_config.el")

;; For box quoting
(require 'boxquote)

;; Show a silly thinking bubble with the selected text
(autoload 'thinks "thinks" "Wraps the selected text in a thinking bubble" t)
;; (require 'thinks)

(require 'tea-time)
(setq tea-time-sound "~/.InitScripts/Emacs/Plugins/ding.wav")

;; For transparancy
;; (set-frame-parameter (selected-frame) 'alpha 70)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Misc helper functions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
