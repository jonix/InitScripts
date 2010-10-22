;;; Keybindings for Emacs ;;;

;; Keystroke customization (functions)

;; For compilations
;; (global-set-key "\C-cc" 'compile)			; to compile from within Emacs
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

;; Folding support (fold code to view just the head of a function, first line of a comment, etc)
(load "folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)

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
(global-set-key [f7] 'bookmark-set)
(global-set-key [f8]  'af-bookmark-cycle-forward )                ;; Next bookmark
(global-set-key [(shift f8)]  'af-bookmark-cycle-reverse )        ;; Prev bookmark
(global-set-key [(shift f7)]  'af-bookmark-clear-all )    ;; Remove all bookmarks

;; (global-set-key (kbd "<M-f2>") 'bookmark-set)
;; (global-set-key [f2]  'af-bookmark-cycle-forward )                ;; Next bookmark
;; (global-set-key [(shift f2)]  'af-bookmark-cycle-reverse )        ;; Prev bookmark
;; (global-set-key [(control shift f2)]  'af-bookmark-clear-all )    ;; Remove all bookmarks

;; Alias C-x k to C-xC-k and C-xC-c
;; Kill named buffer
(global-set-key "\C-x\C-k" 'kill-buffer)
(global-set-key "\C-x\C-c"
                '(lambda () (interactive)
                   (progn (get-buffer-create "*scratch*")
                          (kill-buffer "*scratch*")
                          (save-buffers-kill-emacs t))))

(global-set-key (kbd "<C-tab>") 'yas/expand)

;; Change C-x C-b behavior so it uses bs;
;; shows only interesting buffers.
(global-set-key "\C-x\C-b" 'bs-show)

;; Open file at point
(global-set-key "\C-xp" 'find-file-at-point)

;; (defun my-next-tag ()
;; (interactive)
;; (find-tag t nil))
;; (global-set-key "\M-," 'my-next-tag)

;; C++ (semantic)
;  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
;; (global-set-key [control escape] 'semantic-ia-complete-symbol)
;; semantic-analyze-possible-completions

(global-set-key "\C-cf" 'browse-url-at-point)

;; For box quoting
;; (global-set-key [(shift f2)]  'af-bookmark-cycle-reverse )        ;; Prev bookmark

(global-set-key "\C-xx" 'boxquote-region)
(global-set-key "\C-xX" 'boxquote-insert-file)

;; Smex keybindings, enhances M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
