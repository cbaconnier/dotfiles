(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; Appearance
(column-number-mode 1)
(show-paren-mode 1)
(menu-bar-mode 1)

;; Options
(setq-default 
 tab-width 4
 indent-tabs-mode nil)


;; Backups files
(setq backup-directory-alist `(("." . "~/.emacs.d/.emacs-saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)



(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)




