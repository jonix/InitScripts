;; ==== >>> Add JavaScript support ====
;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; ==== <<< Add JavaScript support end ====

;; ==== >>> Add JavaScript support ====
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(autoload 'espresso-mode "espresso" nil t)
;; ==== <<< Add JavaScript support end ====
