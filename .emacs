(package-initialize)

;; Appearance
(column-number-mode 1)
(show-paren-mode 1)
(menu-bar-mode 1)


;; Options
(setq-default
                                        ;inhibit-splash-screen t
 
			  tab-width 4
			  indent-tabs-mode nil)

;; Backups
(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
(setq make-backup-files nil)
