(use-package magit
  :init
  (progn 
    (use-package magit-blame)
    (use-package magit-bisect)

    (setq magit-restore-window-configuration t)
    (setq magit-commit-signoff t)
    (setq magit-completing-read-function (quote magit-ido-completing-read))
    (setq magit-repo-dirs (quote ("$HOME/src")))))
