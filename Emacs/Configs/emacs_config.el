;; This is the configuration load points for the customization of Emacs
;; Make a symbolic link from this file to ~/.emacs
;;
;; To speed up the start time of Emacs, you could byte-compile the .el files
;; in the Plugins directory
;; In a dired buffer of the ~/bin/emacslib
;; directory, mark the .el files with 'M' and then byte-compile them with  'B'.

;; This .emacs resource loooks interesting, take bit and pieces
;; http://en.wikipedia.org/wiki/User:Gwern/.emacs

;; Naming conventions for support and config files
;;
;; Any file name  "setup_*.el" loads one or more config files, or have small configurations
;; Any file named "config_*.el" handles one aspect of configuring emacs
;;
;; The master .emacs configuration file only loads setup_*.el files
;; to ease finding errors when configuring Emacs between different operating systems


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Very important initial settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Load initial settings
(load-file "~/.InitScripts/Emacs/Configs/setup_initial_config.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Misc core functionality
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.InitScripts/Emacs/Configs/setup_core_functionality.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Appearance customization
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.InitScripts/Emacs/Configs/setup_appearance.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Behaviour configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.InitScripts/Emacs/Configs/setup_behaviour_configuration.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Language support
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (load-file "~/.InitScripts/Emacs/Configs/setup_language_support.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Misc helper functions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (load-file "~/.InitScripts/Emacs/Configs/setup_helper_functions.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Game and fun
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (load-file "~/.InitScripts/Emacs/Configs/setup_game_configuration.el")
