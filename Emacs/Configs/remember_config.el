(add-to-list 'load-path "~/.InitScripts/Emacs/Plugins/remember")
(require 'remember)
(org-remember-insinuate)

(setq org-directory "~/Documents/OrgFiles/")
(setq org-default-notes-file "~/Documents/OrgFiles/notes")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)

;;  Mytemplates on the  home computer
(setq org-remember-templates
			'(("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "~/Documents/GTD/newgtd.org" "Tasks")
				("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  "~/Documents/GTD/journal.org")
				("Clipboard" ?c "** %^{Head Line} %U %^g\n%c\n%?"  "~/Documents/GTD/journal.org")
				("Receipt"   ?r "** %^{BriefDesc} %U %^g\n%?"   "~/Documents/GTD/finances.org")
				("Book" ?b "** %^{Book Title} %t :BOOK: \n%[~/Documents/OrgFiles/.book_template.txt]\n"
         "~/Documents/GTD/journal.org")
				("Film" ?f "** %^{Film Title} %t :FILM: \n%[~/Documents/OrgFiles/.film_template.txt]\n"
         "~/Documents/GTD/journal.org")
				("Daily Review" ?a "** %t :COACH: \n%[~/Documents/OrgFiles/.daily_review.txt]\n"
         "~/Documents/GTD/journal.org")
				("Someday"   ?s "** %^{Someday Heading} %U\n%?\n"  "~/Documents/GTD/someday.org")
				("Vocab"   ?v "** %^{Word?}\n%?\n"  "~/Documents/GTD/vocab.org")
				)
			)
