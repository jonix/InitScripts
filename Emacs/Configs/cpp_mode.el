;; Disable the built-in version of Cedet
;; (setq load-path
;;       (remove (concat "/usr/share/emacs/"
;; 		      (substring emacs-version 0 -2) "/lisp/cedet")
;; 	      load-path))


;; (load-file "~/cedet/common/cedet.el")
;; (load-file "~/Temp/cedet/common/cedet.el")
(load-file "~/.InitScripts/Emacs/Plugins/cedet/common/cedet.el")

(require 'semantic-ia)
(require 'semantic-gcc)

(require 'semantic)
(setq semantic-mode 1)
(semantic-load-enable-code-helpers)
(semantic-load-enable-excessive-code-helpers)

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(require 'semanticdb)
(global-semanticdb-minor-mode 1)


;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
;;(semantic-load-enable-primary-exuberent-ctags-support)

(defun my-cedet-hook ()
  (local-set-key (kbd "<C-return>") 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)


(defun my-c-mode-cedet-hook ()
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)


;; (semantic-add-system-include "~/exp/include/boost_1_37" 'c++-mode)
(setq semantic-load-turn-useful-things-on t)

;; ECB
(add-to-list 'load-path
						 "~/.InitScripts/Emacs/Plugins/ecb")

;; (load-file "~/.InitScripts/Emacs/Plugins/ecb/ecb.el")
(require 'ecb)

;; ==== Start Compile-Mode =====
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cb" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)
;; ==== Start Compile-Mode End =====


;; Save all buffers before compiling
(setq compilation-ask-about-save nil)

;; Tell Emacs to save before compiling
(defun my-save-and-compile ()
  (interactive)
  (save-buffer 0)
  (compile compile-command)
)

;; === Start >> Treat standard C++ header files with no file extension as C++ files ===
(require 'cl)

;; Treat .h files as C++ header files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))



;; Tell Emacs to have a fixed compilation buffers
;; (Special Buffer Frames)
;; (setq special-display-buffer-names
;;	  '("*Completions*" "*grep*" "*tex-shell*"))


;; Lookup Qt C++ doc
;; (require 'qtdoc)

;; Doxygen/Javadoc help
;;(require 'doc-mode)
;; (add-hook 'c-mode-common-hook 'doc-mode)

