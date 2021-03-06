;; === >>> Add Latex AUCTex support ====
; (load "auctex.el" nil t t)
; (load "preview-latex.el" nil t t)
; (setq latex-run-command "pdflatex")
;; == <<< Add Latex AUCTex support end ====

(setq TeX-PDF-mode t); use pdflatex by default

; make latexmk available via C-c C-c
; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; For Doc-view to automatically reload a changed PDF file in Emacs
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . doc-view-mode))
(add-hook 'doc-view-mode-hook 'auto-revert-mode)


;; For setting Skim as PDF viewer
(defun pdfskim ()
	(add-to-list 'TeX-output-view-style
							 (quote ("^pdf$" "." "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")))
)
(add-hook  'LaTeX-mode-hook  'pdfskim  t) ; AUCTeX LaTeX mode


;; Preview a region that contains a math formula
(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)

(require 'latex-preview-pane)

;; Auto-complete Latex
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`
(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
				(append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
								ac-sources)))
(add-hook 'latex-mode-hook 'ac-latex-mode-setup)



;; Test from Latex extra - Should define some sane key shortcuts
;;(eval-after-load 'latex '(latex/setup-keybinds))


;; Extra bits for previewig expression
;(add-to-list 'latex-math-preview-text-symbol-datasets
; 	     latex-math-preview-textcomp-symbol-data)
;(add-to-list 'latex-math-preview-text-symbol-datasets
;	     latex-math-preview-pifont-zapf-dingbats-symbol-data)
;(add-to-list 'latex-math-preview-text-symbol-datasets
;	     latex-math-preview-pifont-symbol-fonts-symbol-data)



;; (setq TeX-view-program-list
;;      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %q")))

;; (setq TeX-view-program-list
;;      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")))

;;(setq TeX-view-program-selection '((output-pdf "Skim")))

;;(setq TeX-view-program-selection
;;      '((output-pdf "PDF Viewer")))


;; Use skim as default PDF Viewer and sync it with Latex line in
;; buffer
;;(custom-set-variables
;; '(LaTeX-command "latex -synctex=1")
;; '(TeX-view-program-list (quote (("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b") ("Preview" "open -a Preview.app %o"))))
;;)
;;(setq TeX-source-correlate-method 'synctex)
;;(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)


;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
;; (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
;; (setq TeX-view-program-list
;;     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; (server-start); start emacs in server mode so that skim can talk to it

;; Put this in ~/.latexmkrc
;;
;; $pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
;; $pdf_previewer = 'open -a skim';
;; $clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';

;; For previewing math formulas inside Emacs
;;(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
;;(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
;;(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
;;(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)
