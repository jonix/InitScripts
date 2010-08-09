;;; Keybindings for Emacs ;;;

;; Keystroke customization (functions)

;; For compilations
(global-set-key "\C-cc" 'compile)						; to compile from within Emacs
(global-set-key "\C-cv" 'recompile)						; to compile from within Emacs
(global-set-key "\C-c." 'next-error)   					; Go to next error
(global-set-key "\C-c," 'previous-error)				; Go to previous error

;; For line jump to
(global-set-key "\C-l" 'goto-line) ; Go to a specified line number

;; Open file with sudo privs
(global-set-key "\C-cs" 'find-alternative-file-with-sudo)


;; Commenting
(global-set-key (kbd "C-;") 'comment-region); Comment a selection
(global-set-key (kbd "C-:") 'uncomment-region); Remove comments from a section

;; Alternative abbrevation expand
;; I don't see any advantages from simple abbrev-expand
(global-set-key (kbd "M-/") 'hippie-expand)


(global-set-key "\M-\C-r" `query-replace-regexp) 		; regexp replace

(global-set-key "\C-co" 'ffap)     ; Go to file under cursor

(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;  (define-key global-map "\C-cr" 'org-remember)
(global-set-key "\C-cr" 'org-remember)
(global-set-key (kbd "<C-tab>") 'php-complete-function)

;; Bookmarking ;;
(global-set-key (kbd "<M-f2>") 'bookmark-set)
(global-set-key [f2]  'af-bookmark-cycle-forward )                ;; Next bookmark
(global-set-key [(shift f2)]  'af-bookmark-cycle-reverse )        ;; Prev bookmark
(global-set-key [(control shift f2)]  'af-bookmark-clear-all )    ;; Remove all bookmarks



