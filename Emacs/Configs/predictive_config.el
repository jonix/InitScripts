;; predictive install location
(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins//predictive")
;; dictionary locations
(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/predictive/latex/")
(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/predictivetexinfo/")
(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/predictive/html/")
;; load predictive package
(require 'predictive)

;;(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins//predictive")
;;(autoload 'predictive-mode "predictive" "predictive" t)
;;(set-default 'predictive-auto-add-to-dict t)
;;(setq predictive-main-dict 'rpg-dictionary
;;      predictive-auto-learn t
;;      predictive-add-to-dict-ask nil
;;      predictive-use-auto-learn-cache nil
;;      predictive-which-dict t)
