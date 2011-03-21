(setq integrated-cedet-p (and (>= emacs-major-version 23)
                              (>= emacs-minor-version 2)))

(unless integrated-cedet-p
  (progn
    (setq cedet-lib "~/.InitScripts/Emacs/Plugins/cedet/common/cedet.el")
    (setq cedet-info-dir "~/.InitScripts/Emacs/Plugins/cedet/common"))
)

(if (boundp 'cedet-info-dir)
    (add-to-list 'Info-default-directory-list cedet-info-dir))

(if (boundp 'cedet-lib)
    (load-file cedet-lib))

(semantic-mode 1)

(global-ede-mode t)

(if (boundp 'semantic-load-enable-excessive-code-helpers)
										; Add-on CEDET
    (progn
      (semantic-load-enable-excessive-code-helpers)
										; TODO: should already be enabled by previous line
      (global-semantic-idle-completions-mode)
      (global-semantic-tag-folding-mode))
										; Integrated CEDET
  (setq semantic-default-submodes
        '(global-semanticdb-minor-mode
          global-semantic-idle-scheduler-mode
          global-semantic-idle-summary-mode
          global-semantic-idle-completions-mode
          global-semantic-decoration-mode
          global-semantic-highlight-func-mode
          global-semantic-stickyfunc-mode)))

(if (boundp 'semantic-ia) (require 'semantic-ia))
(if (boundp 'semantic-gcc) (require 'semantic-gcc))


