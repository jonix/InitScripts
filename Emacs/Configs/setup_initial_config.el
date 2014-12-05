;; To keep custom variables in their own file
;; via the customize interface (M-x customize*)
(setq custom-file "~/.InitScripts/Emacs/Configs/custom_ui_configs.el")
(load custom-file 'noerror)

(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins")
(setq bookmark-default-file "~/.InitScripts/Emacs/Configs/bookmarks.bmk")

;; To support bash aliases
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")
