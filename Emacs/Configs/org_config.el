;; === Start >>> Setup org-mode TODO actions ===

(setq load-path (cons "~/.InitScripts/Emacs/Plugins/org-mode/lisp" load-path))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Follow symbolic links when pressing enter or tab
(setq org-return-follows-link t)
(setq org-tab-follows-link t)

;; === End <<< Setup org-mode TODO actions ===



;; ======= >>> Org mode start =======
;; Remember
(org-remember-insinuate)
(setq org-indent-mode t)
(setq org-hide-leading-stars t)
(setq org-directory "~/Documents/GTD/")
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; ======= <<< Org mode end ===========

;; ======= <<< Bind Pomodoro technique with Org-mode ======
(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)
(add-hook 'org-clock-in-hook '(lambda ()
																(if (not org-timer-current-timer)
																		(org-timer-set-timer '(16)))))
;; Now org-clock-in

;; ======= <<< Pomodoro end ===========



;; ====== >>> Google weather start ==========
;; Add Google weather to Org-mod
(require 'google-weather)
(require 'org-google-weather)
;; ====== <<< Google weather end ========



;; ;; ===== >>> Latex export start ===========
(require 'org-latex)

;; From URL: http://orgmode.org/worg/org-tutorials/org-latex-export.html

;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; (add-to-list 'org-export-latex-classes
;;              '("article"
;;                "\\documentclass{article}"
;;                ("\\section{%s}" . "\\section*{%s}")))

;; (add-to-list 'org-export-latex-classes
;;              '("article"
;;                "\\documentclass{article}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; (setq org-latex-to-pdf-process
;; 			'("texi2dvi -p -b -c -V %f"))



;; From URL: http://emacs-fu.blogspot.com/search/label/org-mode
;;
;; 'djcb-org-article' for export org documents to the LaTex 'article', using
;; XeTeX and some fancy fonts; requires XeTeX (see org-latex-to-pdf-process)
;; (require 'org-export-latex)
;; (add-to-list 'org-export-latex-classes
;; 						 '("djcb-org-article"
;; 							 "\\documentclass[11pt,a4paper]{article}
;; \\usepackage[T1]{fontenc}
;; \\usepackage{fontspec}
;; \\usepackage{graphicx}
;; \\defaultfontfeatures{Mapping=tex-text}
;; \\setromanfont{Gentium}
;; \\setromanfont [BoldFont={Gentium Basic Bold},
;;                 ItalicFont={Gentium Basic Italic}]{Gentium Basic}
;; \\setsansfont{Charis SIL}
;; \\setmonofont[Scale=0.8]{DejaVu Sans Mono}
;; \\usepackage{geometry}
;; \\geometry{a4paper, textwidth=6.5in, textheight=10in,
;;             marginparsep=7pt, marginparwidth=.6in}
;; \\pagestyle{empty}
;; \\title{}
;;       [NO-DEFAULT-PACKAGES]
;;       [NO-PACKAGES]"
;; 							 ("\\section{%s}" . "\\section*{%s}")
;; 							 ("\\subsection{%s}" . "\\subsection*{%s}")
;; 							 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; 							 ("\\paragraph{%s}" . "\\paragraph*{%s}")
;; 							 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;; ;; Of course, this can be customized to your own preference; e.g., North-Americans may not be using A4-paper.
;; ;; org-mode takes care of the export from its own format to LaTeX, but we need to tell it to use xelatex to process the LaTeX to PDF:

;; (setq org-latex-to-pdf-process
;; 			'("xelatex -interaction nonstopmode %f"
;; 				"xelatex -interaction nonstopmode %f")) ;; for multiple passes

;; ===== >>> Latex export end ===========

