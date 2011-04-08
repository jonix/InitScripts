;; Waf/Scons mode start a Make replacement for compiling software
(setq auto-mode-alist
			(cons '("wscript" . python-mode) auto-mode-alist))

(setq auto-mode-alist
			(cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
			(cons '("SConscript" . python-mode) auto-mode-alist))
