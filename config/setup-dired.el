(use-package dired
  :init
  (progn
    (use-package dired+)
    (use-package dired-details)
    (use-package dired-details+)
    (use-package dired-isearch)
    (use-package dired-single)

    (put 'dired-find-alternate-file 'disabled nil)
    (setq dired-recursive-copies (quote always))
    (setq dired-recursive-deletes (quote top))
    (put 'dired-find-alternate-file 'disabled nil)
    (setq dired-dwim-target t)
   
    (add-hook 'dired-mode-hook
              (lambda ()
                (define-key dired-mode-map (kbd "<return>")
                  'dired-find-alternate-file) ; was dired-advertised-find-file
                (define-key dired-mode-map (kbd "^")
                  (lambda () (interactive) (find-alternate-file "..")))))))
