;;; Keybindings for Emacs ;;;
;;; More specific keybindings for various emacs-mode specifified by <mode>_keybindings.el

;; Keystroke customization (functions)

;; For Delete to delete characters forward instead of backwards
(normal-erase-is-backspace-mode 0)
;; (keyboard-translate ?\C-? ?\C-d)

;; make C-h delete (not Help) in ttys
(global-set-key [?\C-h] 'backward-delete-char)

;; Del will delete forward and Backspace will delete backwards
(normal-erase-is-backspace-mode)

;; Help is now M-? instead of C-h
(global-set-key "\M-\?" 'help-command)

;; Toggle sticky buffer (no replace of designated buffer)
(global-set-key "\C-cy" 'toggle-sticky-buffer-window)

;; Open file with sudo privs
(global-set-key "\C-cs" 'find-alternative-file-with-sudo)

;; For line jump to
(global-set-key "\C-l" 'goto-line) ; Go to a specified line number

;; Commenting
(global-set-key (kbd "C-;") 'comment-region)   ; Comment a selection
(global-set-key (kbd "C-:") 'uncomment-region) ; Remove comments from a section

;; Folding support (fold code to view just the head of a function, first line of a comment, etc)
(load "folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)

;; Alternative abbrevation expand
;; I don't see any advantages from simple abbrev-expand
(global-set-key (kbd "M-/") 'hippie-expand)

; regexp replace
(global-set-key "\M-\C-r" `query-replace-regexp)

; Go to file under cursor
(global-set-key "\C-co" 'ffap)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

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

;; Revert/reload the file
(global-set-key "\C-c\C-r" 'revert-buffer)


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

;;(global-set-key (kbd "C-c d") 'ourcomments-insert-date-and-time)
(global-set-key "\C-c\C-d" 'insert-current-date-time)
(global-set-key "\C-c\C-t" 'insert-current-time)


;; TAGS file lookup aided with IDO
(global-set-key "\C-c\C-f" 'ido-find-file-in-tag-files)

;; Set YAsnippet
;; (global-set-key [f6] 'yas/expand)
