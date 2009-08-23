;;; Keybindings for Emacs ;;;

;; Keystroke customization (functions)

;; For compilations
(global-set-key "\C-cc" 'compile)						; to compile from within Emacs
(global-set-key "\C-cv" 'recompile)						; to compile from within Emacs
(global-set-key "\C-c." 'next-error)   					; Go to next error
(global-set-key "\C-c," 'previous-error)				; Go to previous error

;; For line jump to
(global-set-key "\C-l" 'goto-line) ; Go to a specified line number

(global-set-key (kbd "C-;") 'comment-region); Comment a selection
(global-set-key (kbd "C-:") 'uncomment-region); Remove comments from a section


(global-set-key "\M-\C-r" `query-replace-regexp) 		; regexp replace

