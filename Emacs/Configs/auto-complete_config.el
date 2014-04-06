(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.InitScripts/Emacs/plugins/dict")
(global-auto-complete-mode t)

(setq-default ac-sources
              '(
                ac-source-abbrev
                ac-source-dictionary
                ac-source-filename
                ac-source-files-in-current-dir
                ac-source-functions
                ac-source-variables
                ac-source-symbols
                ac-source-features
                ac-source-words-in-all-buffer
                ac-source-words-in-same-mode-buffers))
