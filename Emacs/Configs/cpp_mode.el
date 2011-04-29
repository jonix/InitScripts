;; Disable the built-in version of Cedet
;; (setq load-path
;;       (remove (concat "/usr/share/emacs/"
;; 		      (substring emacs-version 0 -2) "/lisp/cedet")
;; 	      load-path))


;;;;;;;;;;;;;;;;;
;; C++ options
;;;;;;;;;;;;;;;;

;; Save all buffers before compiling
(setq compilation-ask-about-save nil)

;; Tell Emacs to save before compiling
(defun my-save-and-compile ()
  (interactive)
  (save-buffer 0)
  (compile compile-command)
)

(load-file "~/.InitScripts/Emacs/Plugins/sourcepair.el")


;; === Start >> Treat standard C++ header files with no file extension as C++ files ===
(require 'cl)

;; Treat .h files as C++ header files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; For loading C++/header file counterpart
(load-file "~/.InitScripts/Emacs/Plugins/sourcepair.el")
(define-key global-map "\C-ct" 'sourcepair-load)

;; For using EBrowse (ctags for C++)
(global-set-key [f5] 'ebrowse-tree-mode)
(add-to-list 'auto-mode-alist '("BROWSE\\.*" . ebrowse-tree-mode))

;; Tell Emacs to have a fixed compilation buffers
;; (Special Buffer Frames)
;; (setq special-display-buffer-names
;;	  '("*Completions*" "*grep*" "*tex-shell*"))


;;;; ==== Start Compile-Mode =====
;; (autoload 'mode-compile "mode-compile"
;;  "Command to compile current buffer file based on the major mode" t)
;;(global-set-key "\C-cb" 'mode-compile)
;;(autoload 'mode-compile-kill "mode-compile"
;;  "Command to kill a compilation launched by `mode-compile'" t)
;;(global-set-key "\C-ck" 'mode-compile-kill)
;;;; ==== Start Compile-Mode End =====


;; Lookup Qt C++ doc
;; (require 'qtdoc)

;; Doxygen/Javadoc help
;;(require 'doc-mode)
;; (add-hook 'c-mode-common-hook 'doc-mode)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cedet & Semantic configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/ecb")

;; (load-file "~/.InitScripts/Emacs/Plugins/ecb/ecb.el")
(require 'ecb)


;;; From Emacs Mailing list a Cedet configuration
(defun my-next-tag ()
  (interactive)
  (semantic-refresh-tags-safe)
  (senator-next-tag))

(defun activate-more-semantic-bindings ()
  "add some other nice bindings to modes supported by semantic"
  (interactive)
  (local-set-key (kbd "M-n") 'my-next-tag)
  (local-set-key (kbd "M-p") 'senator-previous-tag)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  ;; TODO: the senator stuff should be enabled only where senator actually works!!
  (local-set-key [f6] 'senator-fold-tag-toggle)
  ;; narrows to the actual function or class analyzed
  ;; C-x n w to widen again
  (local-set-key "\C-xnn" 'semantic-narrow-to-tag)
  (local-set-key "\M-." 'semantic-complete-jump)
  (local-set-key "\M-?" 'semantic-ia-fast-jump))

(setq semantic-load-turn-everything-on t)
(global-ede-mode nil)
(setq ede-locate-setup-options '(ede-locate-global ede-locate-locate ede-locate-idutils))

(dolist
    (hook '(python-mode-hook c-mode-common-hook emacs-lisp-mode-hook makefile-mode-hook))
  (add-hook hook 'activate-more-semantic-bindings))

(global-semantic-stickyfunc-mode 1)
;; (global-semantic-decoration-mode 1)
(global-semantic-highlight-func-mode 1)
(global-semantic-highlight-edits-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-mru-bookmark-mode 1)

(defun my-c-like-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))

(defun my-cpp-cedet-hook ()
  (local-set-key ":" 'semantic-complete-self-insert))

(global-semanticdb-minor-mode 1)
(require 'semanticdb-global)
