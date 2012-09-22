;; Add support for reStructuredText
(require 'rst)
(setq auto-mode-alist
      (append '(("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))

;; Update the TOC whne a section title is adjusted
(add-hook 'rst-adjust-hook 'rst-toc-update)

