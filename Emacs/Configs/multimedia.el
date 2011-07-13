(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/emms")

(require 'emms-setup)
(emms-standard)
(emms-default-players)

;; Extra options


;; Show the current track each time EMMS
;; starts to play a track with "NP : "
(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "NP: %s")

;; When asked for emms-play-directory,
;; always start from this one
(setq emms-source-file-default-directory "~/Music/iTunes/iTunes Music/Music/")

;; Want to use alsa with mpg321 ?
(setq emms-player-mpg321-parameters '("-o" "alsa"))

