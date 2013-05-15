;; init.el
;; ------------------------
;; in large parts copied from all over the place,
;; but in particular from http://github/bodil/emacs.d :)

;; FIND VAR NAMES:
;; <YoungFrog> krgn: if you hit RET (or clic) on "State" and use ":" (show saved
;;             lisp expr), you'll get the exact variable name on the left and the
;;             value on the right (in the box)  [12:03]

;; emacs -batch -f batch-byte-compile *.el

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(require 'krgn-path)
(require 'krgn-elpa)
(require 'krgn-auto-complete)
(require 'krgn-win)
(require 'krgn-move-lines)
(require 'krgn-yaml)
(require 'krgn-compile)
(require 'krgn-magit)
(require 'krgn-org)
(require 'krgn-cua)
(require 'krgn-general)
(require 'krgn-rails)
(require 'krgn-rhtml)
(require 'krgn-android)
(require 'krgn-js)
(require 'krgn-yasnippet)
(require 'krgn-erc)
(require 'krgn-scheme)
(require 'krgn-wl)
(require 'krgn-keychain)
(require 'krgn-theme)
(require 'krgn-md)
(require 'krgn-html5)
(require 'krgn-ido-imenu)
(require 'krgn-bindings)
