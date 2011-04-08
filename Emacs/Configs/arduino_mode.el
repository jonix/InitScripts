;; Tell Emacs to highlight Arduino projects with C++ style
(setq auto-mode-alist (append
											 '((".*\\.pde\\'" . c++-mode))
											 auto-mode-alist)
)
