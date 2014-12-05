;; For YASnippet (TextMate like snippets, think "cl+<Tab>" for a full C++ class definition)
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)
(yas/load-directory "~/.InitScripts/Emacs/Plugins/snippets")

;; Rebind yas-expand to escape instead of tab
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-x y") 'yas-expand)
