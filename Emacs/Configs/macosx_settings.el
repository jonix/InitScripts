;; For Mac OS X
;; read in PATH from .bashrc
(if (not (getenv "TERM_PROGRAM"))
		(setenv "PATH"
						(shell-command-to-string "source $HOME/.InitScripts/Bash/macosx_path.sh && printf $PATH")))

;; This might only be necessary on Mac OS X
;; Note: Scrollbars on OS X is relative to the amount of scrolling (bottom of document is a very small scrollbar)
(when window-system
  (mwheel-install))
