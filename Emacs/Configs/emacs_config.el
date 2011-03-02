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
(setq custom-file "~/.InitScripts/Emacs/Configs/emacs_custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins")
(setq bookmark-default-file "~/.InitScripts/Emacs/Configs/emacs_bookmarks.bmk")

;; Emulate some things from Textmate
(require 'textmate)
(textmate-mode)

;; Setup C++ mode
(load-file "~/.InitScripts/Emacs/Configs/cpp_mode.el")
;;(load-file "~/.InitScripts/Emacs/Configs/cedet_mode.el")
;;;; (load-file "~/.InitScripts/Emacs/Configs/cedet_mode_2.el")
;; (load-file "~/.InitScripts/Emacs/Configs/new_cedet_mode.el")


;; Disable the built-in version of Cedet
;; (setq load-path
;;       (remove (concat "/usr/share/emacs/"
;; 		      (substring emacs-version 0 -2) "/lisp/cedet")
;; 	      load-path))

;; Disable the Toolbar
(tool-bar-mode -1)

;; Let long lines disapear out into the right margin
(setq-default truncate-lines t)
;; truncate even even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)


;; Auto byte-compile lisp plugins
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; Lookup Qt C++ doc
;; (require 'qtdoc)


;; Start Emacs in Daemon mode. If you have run Emacs once a daemon is started in the background which all other Emacs is connected to, hence a much faster startup time
;; (server-start)

;; Save all buffers before compiling
(setq compilation-ask-about-save nil)

;; Follow the ouput from Compilation buffer
;; (setq compilation-scroll-output t)
;; Follow the output from Compilation buffer until first error appears
(setq compilation-scroll-output 'first-error)

;; Aliases - Shortening of often used commands
(defalias 'gf 'grep-find)
(defalias 'fd 'find-dired)
(defalias 'sh 'shell)

(defalias 'qrr 'query-replace-regexp)
(defalias 'lml 'list-matching-lines)
(defalias 'dml 'delete-matching-lines)
(defalias 'rof 'recentf-open-files)

(defalias 'gs 'magit-status)

(defalias 'eb 'eval-buffer)
(defalias 'er 'eval-region)
(defalias 'ee 'eval-expression)


;; The startup screen is annoying.
(setq inhibit-startup-message t)
;; (setq initial-scratch-message nil)

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

;; For using the built-in clipboard provided by the OS
(setq menu-bar-enable-clipboard t)

; Deleting files goes to OS's trash folder
(setq delete-by-moving-to-trash t)

; Kill the line including the new line character
(setq kill-whole-line t)

; Try to have wordboundary on seperate lines (don't cut words in half)
; (global-visual-line-mode 1)

;; For smooth scrolling
;; (require 'smooth-scrolling)

;; Show time in status bar.
(setq european-calendar-style t)
(display-time)

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


;; To remove excessive colors when viewing white space
(setq whitespace-style (quote
  ( spaces tabs newline space-mark tab-mark newline-mark)))
;; make whitespace-mode use “¶” for newline and “▷” for tab.
;; together with the rest of its defaults
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [182 10]) ; newline
   (tab-mark 9 [9655 9] [92 9]) ; tab
))

;; To remove trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; move cursor one line when going past end of page
(setq scroll-step 1)

;; something else that should make scrolling nicer
(setq scroll-conservatively 1)

;; Prevent Emacs from making backup files
(setq make-backup-files nil)

;; Tell Emacs to use SmartTab
;;(require 'smart-tab)
;;(global-smart-tab-mode 1)

;; Tell Emacs to save before compiling
(defun my-save-and-compile ()
  (interactive)
  (save-buffer 0)
  (compile compile-command)
)

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


;; Tell Emacs the Tab length
;; For general indentation
;; (setq-default c-basic-offset 4)

;; This might only be necessary on Mac OS X
;; Note: Scrollbars on OS X is relative to the amount of scrolling (bottom of document is a very small scrollbar)
(when window-system
  (mwheel-install))

;; (set-frame-parameter (selected-frame) 'alpha 70)

;; For Delete to delete characters forward instead of backwards
(normal-erase-is-backspace-mode 0)
;; (keyboard-translate ?\C-? ?\C-d)

;; make C-h delete (not Help) in ttys
(global-set-key [?\C-h] 'backward-delete-char)

;; Del will delete forward and Backspace will delete backwards
(normal-erase-is-backspace-mode)

;; Help is now M-? instead of C-h
(global-set-key "\M-\?" 'help-command)

;; Add support for Cups printing
(setq lpr-command "xpp")

;; Add support for Ack (a better grep)
(require 'ack)

;; Add support for reStructuredText
(require 'rst)
(setq auto-mode-alist
      (append '(("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))


;; Open file recursively
(require 'find-recursive)

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


;; Tell Emacs to have a fixed compilation buffers
;; (Special Buffer Frames)
;; (setq special-display-buffer-names
;;	  '("*Completions*" "*grep*" "*tex-shell*"))


;; For easier navigation between multiple visible windows
;; Use meta-arrow keys for simulating CTRL+o
(windmove-default-keybindings 'meta)

;; Let M-x shell show correct colors when working with shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; === Start >> To tell Emacs to use a sane Tab&Space policy ===
(setq-default tab-width 2) ; or any other preferred value
(setq cua-auto-tabify-rectangles nil)

(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defmacro smart-tabs-advice (function offset)
  (defvaralias offset 'tab-width)
  `(defadvice ,function (around smart-tabs activate)
     (if indent-tabs-mode
         (progn
          (save-excursion
             (beginning-of-line)
             (while (looking-at "\t*\\( +\\)\t+")
               (replace-match "" nil nil nil 1)))
           (setq tab-width tab-width)
           (let ((tab-width fill-column)
                 (,offset fill-column))
             ad-do-it))
       ad-do-it)))

;; Sane Tabs for C/C++
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)
;; Sane Tabs for Ruby
(smart-tabs-advice ruby-indent-line ruby-indent-level)
(setq ruby-indent-tabs-mode t)
;; Sane Tabs for Perl
(smart-tabs-advice cperl-indent-line cperl-indent-level)
;; Sane Tabs for Javascript
(smart-tabs-advice js2-indent-line js2-basic-offset)
;; Sane Tabs for Python
(smart-tabs-advice python-indent-line-1 python-indent)
(add-hook 'python-mode-hook
		  (lambda ()
			(setq indent-tabs-mode t)
			(setq tab-width (default-value 'tab-width))))


;; === End << To tell Emacs to use a sane Tab&Space policy ===


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

;; ======= >>> Easy Gnu Privacy Guard (eGPG) ==========
(require 'epa)
(epa-file-enable)
;; (setq epa-armor t) ;; Ascii armor the encrypted file
 ;; ====== <<< Easy Gnu Privacy Guard (eGPG) end ==========

;; ====== >>> Recent files support ==========
(require 'recentf) ;; save recently used files
(recentf-mode t)
(setq
   recentf-max-saved-items 100
   recentf-max-menu-items 25
)
(add-hook 'kill-emacs-hook 'recentf-save-list)
;; ====== <<< Recent files end ==========

;; ===== <<< Bookmark support ====
(load-file "~/.InitScripts/Emacs/Plugins/bookmark_cycling.el")
;; ===== >>> Bookmark support end ====


;; Improving M-x similar to IDO enhances Open File mechanism
(require 'smex)
(smex-initialize)


;; For YASnippet (TextMate like snippets, think "cl+<Tab>" for a full C++ class definition)
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.InitScripts/Emacs/Plugins/yasnippet/snippets")

;; For IDO (Improved buffer switching, much like TextMate ALT+T fuzzy matching) (Ovverides C-x C-f and C-x b)
(require 'ido)
(ido-mode t)

;; Added support for highlighting FIXME in code comments
(require 'fic-mode)
(add-hook 'c++-mode-hook 'turn-on-fic-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-fic-mode)


;; For box quoting
(require 'boxquote)

;; For looking up protocol names
(autoload 'protocols-lookup      "protocols" "Perform a protocol lookup" t)
(autoload 'protocols-clear-cache "protocols" "Clear the protocols cache" t)

;; For looking up services by name
(autoload 'services-lookup      "services" "Perform a service lookup" t)
(autoload 'services-clear-cache "services" "Clear the service cache"  t)

;; Looking up TLD (top level domains) by abbrevation or complete country name
(autoload 'tld "tld" "Perform a TLD lookup" t)


;; Show a silly thinking bubble with the selected text
(autoload 'thinks "thinks" "Wraps the selected text in a thinking bubble" t)
;; (require 'thinks)


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




;; === >>> Complete anything support =====
;; Add company The package to COMP(lete) ANY(thing)
;; (add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/company")
;; (autoload 'company-mode "company" nil t)
;; ==== <<< Complete anything end ====


;; ==== >>> Ascii Table support =====
(require 'table)
(add-hook 'text-mode-hook 'table-recognize)
;; ==== <<< Ascii Table support end =====

;; Synthax highlight RTF file structure
(autoload 'rtf-mode "rtf-mode.el" "RTF mode" t)
(add-to-list 'auto-mode-alist
  '("\\.rtf$" . rtf-mode))

;; ==== >>> Ditaa support (Render ascii to graphics)
(setq ditaa-cmd "java -jar ~/Scripts/ditaa0_9.jar")
(defun ditaa-generate()
  (interactive)
  (shell-command
   (concat ditaa-cmd " " buffer-file-name)))
;; ==== <<< Ditaa support end =========


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

;; (load "~/.InitScripts/Emacs/Plugins/icicles-install")
(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/icicles")
(require 'icicles)


;; Doxygen/Javadoc help
;;(require 'doc-mode)
;; (add-hook 'c-mode-common-hook 'doc-mode)

;; Automatically load TAGS file
(require 'etags-table)

;; ==== Start Compile-Mode =====
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
 (global-set-key "\C-cb" 'mode-compile)
 (autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
 (global-set-key "\C-ck" 'mode-compile-kill)
;; ==== Start Compile-Mode End =====

;; Put etags information in bookmark
;; (defun ivan-etags-bookmark ()
;;  (bookmark-set tagname))
;;(add-hook 'find-tag-hook 'ivan-etags-bookmark)


;; Add scratch buffer with previous selected mode active
(autoload 'scratch "scratch" nil t)

;; Ensure the cursor is top/bottom most when scrolling, I.E the mouse reaches top/bottom of the document
(require 'fscroll)


;; Add support for encode (obfuscate) to a URL path to contain % characters
(autoload 'obfuscate-url "obfusurl" "Obfuscate URL under point" t)

;;; Loading extracted settings ;;;
(load-file "~/.InitScripts/Emacs/Configs/emacs_config_highlighting.el")
(load-file "~/.InitScripts/Emacs/Configs/emacs_config_keybindings.el")

;; ========================================================
;; Override add-ons fixation on setting debug mode

;; Disable Lisp debugging mode
(setq debug-on-error nil)

;; Disable Ctrl+x, Ctrl+c, and other "standardized" keyboard shortcuts for copy and paste text. Why? Because Ctrl+x is used in many key combinations.
(cua-mode nil)


(put 'narrow-to-region 'disabled nil)

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
