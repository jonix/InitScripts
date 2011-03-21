;; ====== >>> Recent files support ==========
(require 'recentf) ;; save recently used files
(recentf-mode t)
(setq
 recentf-max-saved-items 100
 recentf-max-menu-items 25
 )
(add-hook 'kill-emacs-hook 'recentf-save-list)
;; ====== <<< Recent files end ==========
