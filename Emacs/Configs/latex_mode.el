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

;; For Doc-view to automatically reload a changed PDF file in Emacs
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . doc-view-mode))
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

