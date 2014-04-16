(setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem
;; (setq-default ispell-program-namE "aspell")
(setq ispell-program-name "/usr/local/bin/aspell")

;; Another guessing algorithm
(require 'auto-lang)

;; Guess the language in a document
(setq guess-buffer-default "en")
(defun guess-buffer-language ()
  "Guess language using mguesser."
  (let ((buf (get-buffer-create " *guess-lang*"))
        proc)
    (with-current-buffer buf
      (erase-buffer))
    (setq proc
          (start-process "guess-lang" buf "guess-lang"))
    (process-send-region proc (point-min) (point-max))
    (process-send-eof proc)
    (accept-process-output proc 0.3)
    (delete-process proc)
    (with-current-buffer buf
      (goto-char (point-min))
      (prog1
          (if (looking-at "^[0-9.]+\\s-+\\([a-z-]+\\)")
              (match-string 1)
            guess-buffer-default)
        (kill-buffer)))))

(defun guess-language ()
  "Guess language in the current buffer."
  (interactive)
  (message (guess-buffer-language)))
