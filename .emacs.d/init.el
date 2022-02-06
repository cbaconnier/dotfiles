;; Appearance
(column-number-mode 1)
(show-paren-mode 1)
(menu-bar-mode 1)

;; Options
(setq-default
                                        ;inhibit-splash-screen t
 
			  tab-width 4
			  indent-tabs-mode nil)

;; Backups files
(setq backup-directory-alist `(("." . "~/.emacs.d/.emacs-saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)


;;;;;;;;
;; Packages

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;; Bootstrap `use-package'
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; `try' let's you try packages without installing them.
(use-package try
  :ensure t)

;; `wich-key' brings up help on key combinations
(use-package which-key
  :ensure t
  :config (which-key-mode))


;; (load "~/.emacs.d/rust.el")
(load "~/.emacs.d/custom.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
