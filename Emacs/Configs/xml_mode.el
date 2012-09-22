;; Tell Emacs how to highlight XML files
(load "~/.InitScripts/Emacs/Plugins/nxml-mode/rng-auto.el")
(setq auto-mode-alist
			(cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
						auto-mode-alist))
(setq nxml-child-indent 4)
