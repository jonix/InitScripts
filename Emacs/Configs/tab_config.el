;; Tell Emacs to use SmartTab
;;(require 'smart-tab)
;;(global-smart-tab-mode 1)

;; Tell Emacs the Tab length
;; For general indentation
;; (setq-default c-basic-offset 4)


;; === Start >> To tell Emacs to use a sane Tab&Space policy ===
(setq-default tab-width 2) ; or any other preferred value
(setq cua-auto-tabify-rectangles nil)

(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defmacro smart-tabs-advice (function offset)
  (defvaralias offset 'tab-width)
  `(defadvice ,function (around smart-tabs activate)
     (if indent-tabs-mode
         (progn
					 (save-excursion
             (beginning-of-line)
             (while (looking-at "\t*\\( +\\)\t+")
               (replace-match "" nil nil nil 1)))
           (setq tab-width tab-width)
           (let ((tab-width fill-column)
                 (,offset fill-column))
             ad-do-it))
       ad-do-it)))

;; Sane Tabs for C/C++
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)
;; Sane Tabs for Ruby
(smart-tabs-advice ruby-indent-line ruby-indent-level)
(setq ruby-indent-tabs-mode t)
;; Sane Tabs for Perl
(smart-tabs-advice cperl-indent-line cperl-indent-level)
;; Sane Tabs for Javascript
(smart-tabs-advice js2-indent-line js2-basic-offset)
;; Sane Tabs for Python
(smart-tabs-advice python-indent-line-1 python-indent)
(add-hook 'python-mode-hook
					(lambda ()
						(setq indent-tabs-mode t)
						(setq tab-width (default-value 'tab-width))))


;; === End << To tell Emacs to use a sane Tab&Space policy ===
