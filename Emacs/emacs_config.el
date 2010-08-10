;; This is the configuration load points for the customization of Emacs
;; Make a symbolic link from this file to ~/.emacs
;;
;; To speed up the start time of Emacs, you could byte-compile the .el files
;; in the Plugins directory
;; In a dired buffer of the ~/bin/emacslib
;; directory, mark the .el files with 'M' and then byte-compile them with  'B'.


;; To keep custom variables in their own file
;; via the customize interface (M-x customize*)
(setq custom-file "~/.InitScripts/Emacs/emacs_custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins")

;; Auto byte-compile lisp plugins
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; The startup screen is annoying.
(setq inhibit-startup-message t)

;; For disabling pc speaker beeps. Flashes instead
(setq visible-bell t)

;; For using the built-in clipboard provided by the OS
(setq menu-bar-enable-clipboard t)

; Deleting files goes to OS's trash folder
(setq delete-by-moving-to-trash t)

; Try to have wordboundary on seperate lines (don't cut words in half)
; (global-visual-line-mode 1)

;; For smooth scrolling
;; (require 'smooth-scrolling)

;; Show time in status bar.
(setq european-calendar-style t)
(display-time)

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
(require 'smart-tab)
(global-smart-tab-mode 1)

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

(add-hook 'c-mode-common-hook
 (lambda()
   (flyspell-mode 1)))

(add-hook 'php-mode-hook
 (lambda()
   (flyspell-mode 1)))

(add-hook 'org-mode-hook
 (lambda()
   (flyspell-mode 1)))

(add-hook 'ruby-mode-hook
 (lambda()
   (flyspell-mode 1)))

(add-hook 'perl-mode-hook
 (lambda()
   (flyspell-mode 1)))

(add-hook 'javascript-mode-hook
 (lambda()
   (flyspell-mode 1)))

(add-hook 'LaTeX-mode-hook
 (lambda()
   (flyspell-mode 1)))


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

;; === <<< Open files with sudo privs start =========
(defun find-alternative-file-with-sudo ()
  "Open current buffer as root!"
   (interactive)
   (when buffer-file-name
     (find-alternate-file
        (concat "/sudo:root@localhost:"
 	      buffer-file-name))))
;; === <<< Open files with sudo privs end =========


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
(setq-default tab-width 4) ; or any other preferred value
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


;;;; For YASnippet (TextMate like snippets, think "cl+<Tab>" for a full C++ class definition)
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.InitScripts/Emacs/Plugins/yasnippet/snippets")

;; For IDO (Improved buffer switching, much like TextMate ALT+T fuzzy matching) (Ovverides C-x C-f and C-x b)
(require 'ido)
(ido-mode t)

;; For Git commands
;;(load-file "~/.InitScripts/Emacs/Plugins/sourcepair.el")
;;(require 'magit)
(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins")
(require 'magit)

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
;; === End << Setup org-mode TODO actions ===

;; ======= >>> Org mode start =======
;; Remember
(org-remember-insinuate)
  (setq org-indent-mode t)
  (setq org-hide-leading-stars t)
  (setq org-directory "~/Documents/GTD/")
  (setq org-default-notes-file (concat org-directory "/notes.org"))

;; ======= <<< Org mode end ===========

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

;;; Loading extracted settings ;;;
(load-file "~/.InitScripts/Emacs/emacs_config_highlighting.el")
(load-file "~/.InitScripts/Emacs/emacs_config_keybindings.el")

;; Folding support ;;;
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


;; ========================================================
;; Override add-ons fixation on setting debug mode

;; Disable Lisp debugging mode
(setq debug-on-error nil)

;; Disable Ctrl+x, Ctrl+c, and other "standardized" keyboard shortcuts for copy and paste text. Why? Because Ctrl+x is used in many key combinations.
(cua-mode nil)


(put 'narrow-to-region 'disabled nil)
