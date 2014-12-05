(load-file "~/.InitScripts/Emacs/Configs/2048_config.el")

;; For box quoting
(require 'boxquote)

;; Show a silly thinking bubble with the selected text
(autoload 'thinks "thinks" "Wraps the selected text in a thinking bubble" t)
;; (require 'thinks)

(require 'tea-time)
(setq tea-time-sound "~/.InitScripts/Emacs/Plugins/ding.wav")

;; For transparancy
;; (set-frame-parameter (selected-frame) 'alpha 70)
