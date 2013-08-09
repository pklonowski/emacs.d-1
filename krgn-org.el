(require 'org)

;;(setq org-ditaa-jar-path "~/java/ditaa0_6b.jar") (setq org-plantuml-jar-path "~/share/plantuml/plantuml.jar")
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'flyspell-mode)

;; change the flyspell languange with:
;; (ispell-change-dictionary lang)

(setq org-clock-persist 'history)

(org-clock-persistence-insinuate)

(setq org-directory "~/org")
(setq org-agenda-files (quote ("~/org/agenda.org")))
(setq org-agenda-window-setup (quote other-frame))
(setq org-archive-location "~/org/archive/%s_archive::")
(setq org-mobile-directory "~/dwn/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/org/todo.org") 
(setq org-src-fontify-natively t) 
(setq org-src-lang-modes
      (quote (("ocaml" . tuareg)
              ("elisp" . emacs-lisp)
              ("ditaa" . artist)
              ("asymptote" . asy)
              ("dot" . fundamental)
              ("sqlite" . sql)
              ("calc" . fundamental)
              ("C" . c)
              ("cpp" . c++)
              ("screen" . shell-script)
              ("ruby" . ruby)
              ("plantuml" . fundamental))))
(setq org-babel-results-keyword "results")
(setq org-src-preserve-indentation t)

;; '(org-blank-before-new-entry (quote ((heading) (plain-list-item)))) ;; '(org-cycle-separator-lines 1) ;; '(org-empty-line-terminates-plain-lists t) 
;; '(org-src-window-setup (quote current-window))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (gnuplot . t)
         (sh . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

(setq org-confirm-babel-evaluate nil)

(provide 'krgn-org)
