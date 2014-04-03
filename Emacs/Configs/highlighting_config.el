;; Syntax highligting definition customization


(defun file-in-directory-list-p (file dirlist)
"Returns true if the file specified is contained within one of
the directories in the list. The directories must also exist."
(let ((dirs (mapcar 'expand-file-name dirlist))
(filedir (expand-file-name (file-name-directory file))))
(and
(file-directory-p filedir)
(member-if (lambda (x) ; Check directory prefix matches
(string-match (substring x 0 (min(length filedir) (length x))) filedir))
dirs))))

(defun buffer-standard-include-p ()
"Returns true if the current buffer is contained within one of
the directories in the INCLUDE environment variable."
(and (getenv "INCLUDE")
(file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(add-to-list 'magic-fallback-mode-alist '(buffer-standard-include-p . c++-mode))

;; Tell Emacs to syntax highlight file that is emacs_config
(setq auto-mode-alist (append
											 '(("emacs_config" . lisp-mode))
											 auto-mode-alist)
      )

;; == Start >> C++ IDE setup ==
;; ---- Deprecated -----

;; =============== Disabled C++ support start ====================

;;(ede-cpp-root-project "Test"
;;                :name "Test Project"
;;                :file "~/Projects/Work/Mapiton/Native/RenderPig/Source/CommonSource/CMakeLists.txt"
;;                :include-path '("/"
;;                                "/Auxiliary/"
;;                                "/Rendering//"
;;                                "/UIs/"
;;                               )
;;;;                :system-include-path '("~/exp/include")
;;                :spp-table '(("isUnix" . "")
;;                             ("BOOST_TEST_DYN_LINK" . "")))
;;

;;;; Disabled since I am not using Emacs for C++ developing
;; For Cedet (Project management)
;;(load-file "~/.InitScripts/Emacs/Plugins/cedet/common/cedet.el")
;;(global-ede-mode t)
;;(semantic-load-enable-excessive-code-helpers)
;;;(semantic-load-enable-excessive-code-helpers)
;;;(semantic-load-enable-excessive-code-helpers)

;;;; Enable EDE for a pre-existing C++ project
;;;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;;;; Enabling Semantic (code-parsing, smart completion) features
;;;; Select one of the following:

;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;;(semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;; Provide intellisense when typing . on a instance name
;;(defun my-cedet-hook ()
;;  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;;(add-hook 'c-mode-common-hook 'my-cedet-hook)

;;(defun my-c-mode-cedet-hook ()
;; (local-set-key "." 'semantic-complete-self-insert)
;; (local-set-key ">" 'semantic-complete-self-insert))
;;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;;(require 'semantic-gcc)

;; ==== <<< Cedet end =========

;; =============== Disabled C++ support end ====================
