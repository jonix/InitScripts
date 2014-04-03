;; For compilations, using global keybindings
;(global-set-key "\C-cc" 'compile)         ; to compile from within Emacs
;(global-set-key "\C-cv" 'recompile)       ; to compile from within Emacs
;(global-set-key "\C-c." 'next-error)   	 ; Go to next error
;(global-set-key "\C-c," 'previous-error)	 ; Go to previous error

;; For compilations, using keybindings specific to C/C++
;(eval-after-load "cc-mode"
;  '(progn
;     (define-key c-mode-map (kbd "C-c C") 'compile)
;     (define-key c-mode-map (kbd "C-c v") 'recompile)
;   	 (define-key c-mode-map (kbd "C-c .") 'next-error)
;   	 (define-key c-mode-map (kbd "C-c ,") 'previous-error)
;		 )
;	)


(defun jonix-add-cpp-keys ()
	(local-set-key (kbd "C-c c") 'compile)
	(local-set-key (kbd "C-c v") 'recompile)
	(local-set-key (kbd "C-c e") 'next-error)
	(local-set-key (kbd "C-c p") 'previous-error)
)
(add-hook 'c-mode-hook `jonix-add-cpp-keys)
(add-hook 'c++-mode-hook `jonix-add-cpp-keys)




;; C/C++ source code lookup key bindings (cscope)
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]
  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]  'cscope-display-buffer)
(define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)
