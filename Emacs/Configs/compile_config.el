;; Does compilation when saving file
;;
;;
;; Using recompile-on-save:
;; You should have at least one source buffer and one compilation
;; buffer. When you run M-x recompile-on-save in the source buffer it
;; will ask you for a compilation buffer which you want to associate
;; with it. After that, each save of the source buffer will trigger
;; recompilation in the associated compilation buffer.
;;
;; To make this process even easier you might advice any compilation
;; function (e.g., compile) using recompile-on-save-advice.
;;
;; (recompile-on-save-advice compile)
;;
;; This way source <-> compilation buffer association will happen
;; automatically when you run M-x compile.
;;
;; To (temporarily) disable automatic recompilation turn off
;; recompile-on-save-mode.
;;
;; To reset compilation buffers associations for current source buffer
;; use M-x reset-recompile-on-save

(require 'recompile-on-save)
(recompile-on-save-advice compile)



;; trying to close the buffer when compilation is Cleaning ;; Close the compilation window if there was no error at all.
(setq compilation-exit-message-function
			(lambda (status code msg)
				;; If M-x compile exists with a 0
				(when (and (eq status 'exit) (zerop code))
					;; then bury the *compilation* buffer, so that C-x b doesn't go there
					(bury-buffer "*compilation*")
					;; and return to whatever were looking at before
					(replace-buffer-in-windows "*compilation*")
					(delete-other-windows)
					)
				;; Always return the anticipated result of compilation-exit-message-function
				(cons msg code))
)
