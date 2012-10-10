;; For Mac OS X
;; read in PATH from .bashrc
(if (not (getenv "TERM_PROGRAM"))
		(setenv "PATH"
						(shell-command-to-string "source $HOME/.InitScripts/Bash/macosx_path.sh && printf $PATH")))

;; This might only be necessary on Mac OS X
;; Note: Scrollbars on OS X is relative to the amount of scrolling (bottom of document is a very small scrollbar)
(when window-system
  (mwheel-install))

;; These are for Aquamacs, they are incompatible with GNU/Emacs on Mac
(when (boundp 'aquamacs-version)
	(tabbar-mode -1)

	;(aquamacs-autoface-mode -1)                              ; no mode-specific faces, everything in Monaco
	(set-face-attribute 'mode-line nil :inherit 'unspecified) ; show modeline in Monaco
	(set-face-attribute 'echo-area nil :family 'unspecified)  ; show echo area in Monaco

	;; This line is required for Aquamacs for cut&yank
	(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
	;; While GNU/Emacs on Mac requires this setting
  ;; (setq interprogram-paste-function 'x-selection-value)
	;; Which is set in emacs_config.el file
)
