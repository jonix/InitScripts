(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 215 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(completion-ignored-extensions (quote (".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "Build/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".fasl" ".ufsl" ".fsl" ".dxl" ".pfsl" ".dfsl" ".p64fsl" ".d64fsl" ".dx64fsl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo")))
 '(cua-mode t nil (cua-base))
 '(default-frame-alist (quote ((menu-bar-lines . 1) (foreground-color . "Black") (background-color . "White") (cursor-type . box) (cursor-color . "Red") (vertical-scroll-bars . right) (internal-border-width . 0) (left-fringe . 1) (right-fringe) (fringe) (tool-bar-lines . 0))))
 '(display-time-mode t)
 '(ecb-compile-window-height 6)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/Projects/Work/Mapiton/Native/Source" ("/home/jonix/Projects/Work/Mapiton/Native/Source/WatchBoar/Source" "WatchBoar"))))
 '(isearch-allow-scroll t)
 '(js2-auto-indent-p t)
 '(js2-enter-indents-newline t)
 '(ns-alternate-modifier (quote super))
 '(ns-command-modifier (quote meta))
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(php-manual-path "~/Documents/PHPDoc/")
 '(save-place t nil (saveplace))
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(vc-handled-backends (quote (Git SVN Bzr CVS Hg Mtn Arch)))
 '(visual-line-mode nil t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:background "black" :foreground "yellow"))))
 '(latex-mode-default ((t (:inherit text-mode-default :stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 130 :width normal :family "Monaco")))))

;; Check custom-file compatibility
(when (and (boundp 'aquamacs-version-id)
           (< (floor (/ aquamacs-version-id 10))
	   (floor (/ aquamacs-customization-version-id 10))))
  (defadvice frame-notice-user-settings (before show-version-warning activate)
    (defvar aquamacs-backup-custom-file nil "Backup of `custom-file', if any.")
    (setq aquamacs-backup-custom-file "~/.InitScripts/Emacs/Configs/customizations.2.0.el")
    (let ((msg "Aquamacs options were saved by a more recent program version.
Errors may occur.  Save Options to overwrite the customization file. The original, older customization file was backed up to ~/.InitScripts/Emacs/Configs/customizations.2.0.el."))
      (if window-system
	  (x-popup-dialog t (list msg '("OK" . nil) 'no-cancel) "Warning")
	(message msg)))))
;; End compatibility check
