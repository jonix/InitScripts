(defalias 'perl-mode 'cperl-mode)
(setq cperl-hairy t) ;; Turns on most of the CPerlMode options

;; this fixes the problem that most color themes have with cperl-mode.
(defvar cperl-array-face)               ;tell compiler not to warn
                                        ;about this varible
(add-hook 'cperl-mode-hook (lambda () (set-face-background
                                       cperl-array-face nil)))

;; From the O'reilly book Perl Hacks
(defun perl-eval (beg end)
  "Pass selected region to the shell command perl."
  (interactive "r")
  (shell-command-on-region beg end "perl"))
