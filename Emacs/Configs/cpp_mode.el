;; (load-file "~/cedet/common/cedet.el")

;; (require 'semantic-ia)
;; (require 'semantic-gcc)

(require 'semantic)
(setq semantic-mode 1)
;;(semantic-load-enable-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

;; (require 'semanticdb)
;; (global-semanticdb-minor-mode 1)


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
