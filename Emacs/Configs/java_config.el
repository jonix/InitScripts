;; java-mode does not indent Java 1.5 @-style annotations correctly. A quick fix is to define them as comments:[1]
(add-hook 'java-mode-hook
					(lambda ()
						"Treat Java 1.5 @-style annotations as comments."
						(setq c-comment-start-regexp "(@|/(/|[*][*]?))")
						(modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

;; Set 4 spaces as indent
(add-hook 'java-mode-hook (lambda ()
														(setq c-basic-offset 4)))

;; Set tabs to 4 spaces
(add-hook 'java-mode-hook (lambda ()
														(setq c-basic-offset 4
																	tab-width 4
																	indent-tabs-mode nil)))

;; (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
