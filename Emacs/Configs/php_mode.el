(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Remove inherited background
;;  http://stackoverflow.com/questions/3042123/in-emacs-how-to-stop-nxthml-to-mess-with-my-background-color
(setq mumamo-background-colors nil)
;; (set-face-background "mmm-default-submode-face" nil)
;; (set-face-background 'mmm-default-submode-face "gray16")

(defun jonix-php-symbol-lookup ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")

      (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                          (symbol-name symbol))))))
