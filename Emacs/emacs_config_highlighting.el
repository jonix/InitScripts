;; Syntax highligting definition customization

;; Setup syntax highlighting
(setq global-font-lock-mode t)
(setq font-lock-mode-maximum-decoration t)
(require 'font-lock)

;; Highlight matching parenthesis () [] {} <> (depending on the mode)
(require 'paren)



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

;; Treat .h files as C++ header files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))



;; === Start >> Treat standard C++ header files with no file extension as C++ files ===
(require 'cl)

(defun file-in-directory-list-p (file dirlist)
"Returns true if the file specified is contained within one of
the directories in the list. The directories must also exist."
(let ((dirs (mapcar 'expand-file-name dirlist))
(filedir (expand-file-name (file-name-directory file))))
(and
(file-directory-p filedir)
(member-if (lambda (x) ; Check directory prefix matches
(string-match (substring x 0 (min(length filedir) (length x))) filedir))
dirs))))

(defun buffer-standard-include-p ()
"Returns true if the current buffer is contained within one of
the directories in the INCLUDE environment variable."
(and (getenv "INCLUDE")
(file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(add-to-list 'magic-fallback-mode-alist '(buffer-standard-include-p . c++-mode))

;; == End << Treat standard C++ header files with no file extension as C++ files ===

