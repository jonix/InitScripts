;; === <<< Ruby and .rhtml support start =========
(defun rhtml-modes ()
  (two-mode-mode)
  (rhtml-minor-mode))

(setq auto-mode-alist
      (cons '("\\.rhtml$" . rhtml-modes)
						auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.html\\.erb$" . rhtml-modes)
						auto-mode-alist))


;; For RoR in RubyOnRails (From the RoR official site recommendation)
;; (setq load-path (cons "~/.InitScripts/Emacs/Plugins/emacs-rails" load-path))
;; (require 'rails)
