;; For Git commands
(require 'magit)
(require 'git)
(require 'git-blame)

(when (locate-library "magit")
	(remq 'Git vc-handled-backends)
	(autoload 'magit-status "magit" "magit front end" t))


