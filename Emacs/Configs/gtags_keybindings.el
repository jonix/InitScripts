;; M-; cycles to next result, after doing M-. C-M-. or C-M-,
(global-set-key "\M-;" 'ww-next-gtag)

;; M-. finds tag
(global-set-key "\M-." 'gtags-find-tag)

;; C-M-. find all references of tag
(global-set-key (kbd "M-C-.") `gtags-find-rtag)


;; C-M-, find all usages of symbol.
(global-set-key (kbd "M-C-,") `gtags-find-symbol)

