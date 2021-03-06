(use-package ido
  :init
  (progn
    (use-package thingatpt)
    (use-package imenu)
    (use-package cl)
    (use-package fuzzy-match)
    (use-package ido-vertical-mode
      :init
      (ido-vertical-mode t))
    (use-package ido-ubiquitous
      :init
      (ido-ubiquitous-mode 1))
    (use-package ido-hacks
      :init
      (ido-hacks-mode t))
    (use-package smex
      :init
      (progn
        (smex-initialize)
        (global-set-key (kbd "M-x") 'smex)))

    (ido-mode t)
    (ido-everywhere t)

    (setq ido-enable-flex-matching t)
    (setq imenu-auto-rescan t)
    (setq imenu-max-item-length 100)
    (setq imenu-use-popup-menu t)

    (defun ibuffer-ido-find-file ()
      "Like `ido-find-file', but default to the directory of the buffer at point."
      (interactive
       (let ((default-directory (let ((buf (ibuffer-current-buffer)))
                                  (if (buffer-live-p buf)
                                      (with-current-buffer buf
                                        default-directory)
                                    default-directory))))
         (ido-find-file-in-dir default-directory))))

    (add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map "\C-x\C-f" 'ibuffer-ido-find-file)))

    (defun mine-goto-symbol-at-point ()
      "Will navigate to the symbol at the current point of the cursor"
      (interactive)
      (ido-goto-symbol (thing-at-point 'symbol)))

    (defun ido-goto-symbol (&optional a-symbol)
      "Will update the imenu index and then use ido to select a symbol to navigate to"
      (interactive)
      (imenu--make-index-alist)
      (let ((name-and-pos '())
            (symbol-names '()))
        (cl-flet ((add-symbols (symbol-list)
                               (when (listp symbol-list)
                                 (dolist (symbol symbol-list)
                                   (let ((name nil) (position nil))
                                     (cond
                                      ((and (listp symbol) (imenu--subalist-p symbol))
                                       (add-symbols symbol))

                                      ((listp symbol)
                                       (setq name (car symbol))
                                       (setq position (cdr symbol)))

                                      ((stringp symbol)
                                       (setq name symbol)
                                       (setq position (get-text-property 1 'org-imenu-marker symbol))))

                                     (unless (or (null position) (null name))
                                       (add-to-list 'symbol-names name)
                                       (add-to-list 'name-and-pos (cons name position))))))))
          (add-symbols imenu--index-alist))
        (let* ((selected-symbol
                (if (null a-symbol)
                    (ido-completing-read "Symbol? " symbol-names)
                  a-symbol))
               (position (cdr (assoc selected-symbol name-and-pos))))
          (cond
           ((overlayp position)
            (goto-char (overlay-start position)))
           (t
            (goto-char position))))))

    (global-set-key (kbd "C-c i") 'ido-goto-symbol)))
