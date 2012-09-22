;; Load CSS-mode
(autoload 'css-mode "css-mode")
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))

;; change CSS-mode indentation style to c-style
(setq cssm-indent-function #'cssm-c-style-indenter)
