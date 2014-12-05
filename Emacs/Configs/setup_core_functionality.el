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

;; Ease the task of renaming a file
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))
