;; Tell Emacs to syntax highlight file that is emacs_config
(setq auto-mode-alist (append
	  '(("emacs_config" . lisp-mode))
			 auto-mode-alist)
      )

;; Tell Emacs to highlight Arduino projects with C++ style
(setq auto-mode-alist (append
	  '((".*\\.pde\\'" . c++-mode))
			 auto-mode-alist)
)

