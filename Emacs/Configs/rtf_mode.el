;; Synthax highlight RTF file structure
(autoload 'rtf-mode "rtf-mode.el" "RTF mode" t)
(add-to-list 'auto-mode-alist
						 '("\\.rtf$" . rtf-mode))
