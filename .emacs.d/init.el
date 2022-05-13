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
(setq auto-save-default nil) ; stop creating #autosave# files



(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)


;;;;;;;;;;;;;;
;;

;; `wich-key' brings up help on key combinations
(use-package which-key
  :ensure t
    :config (which-key-mode))


(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
    (lsp-headerline-breadcrumb-mode))


(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))


(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :custom
    (lsp-ui-doc-position 'bottom))


(use-package company
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
    (company-idle-delay 0.0))


(use-package flycheck :defer 2
  :ensure t
  :init (global-flycheck-mode)
  ;;:custom (flycheck-display-errors-delay .3)
  )

(use-package company-box
    :ensure t
    :hook (company-mode . company-box-mode))


(use-package dap-mode
  ;; Uncomment the config below if you want all UI panes to be hidden by default!
  ;; :custom
  ;; (lsp-enable-dap-auto-configure nil)
  ;; :config
  ;; (dap-ui-mode 1)
  :ensure t
  :config
  ;; Set up Node debugging
  (require 'dap-node)
  (dap-node-setup) ;; Automatically installs Node debug adapter if needed

  ;; Bind `C-c l d` to `dap-hydra` for easy access
;  (general-define-key
;   :keymaps 'lsp-mode-map
;   :prefix lsp-keymap-prefix
                                        ;   "d" '(dap-hydra t :wk "debugger"))
  )





;; PHP
                                        ; https://github.com/xcwen/ac-php
                                        ; https://github.com/choma/.emacs.d/blob/master/init.el
                                        ; https://github.com/kermorgant/.emacs.d/blob/master/lang/mk-php.el
                                        ;https://www.philnewton.net/guides/emacs-as-a-php-editor/
                                        ; https://sachachua.com/blog/2008/07/emacs-and-php-tutorial-php-mode/




(use-package company-php :ensure t)

(use-package php-mode
  :ensure t
  :mode ("\\.php\\'" . php-mode)
  ;:init
  ;(setq php-mode-coding-style (quote psr2))
  ;(setq php-search-documentation-browser-function 'eww-browse-url)
  ;(setq php-style-delete-trailing-whitespace 1)
  :hook((php-mode . company-php))
)

                                        ;(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

(use-package transient :ensure t)
(use-package phpactor :ensure t)
(use-package company-phpactor :ensure t)

(use-package ac-php
  :ensure t)


(defun company-php ()
  "Add backends for php completion in company mode."
  (interactive)
  (require 'company)
  (require 'company-phpactor)
  (set (make-local-variable 'company-backends)
       '(;; list of backends
         ;; company-lsp
         company-phpactor
         company-files
         ;; company-keywords       ; keywords
         ;;company-dabbrev-code   ; code words
         ;; company-lsp            ; lsp completion
         ;;company-capf
                  )))

;(use-package web-mode :ensure t)
;(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;(setq web-mode-engines-alist
;      '(("php"    . "\\.phtml\\'") ("blade"  . "\\.blade\\.")))
;(setq web-mode-code-indent-offset 4
;      web-mode-indent-style 4)

;; CSS
;(use-package lsp-tailwindcss :ensure t)


;; Python
; https://github.com/daviwil/emacs-from-scratch/blob/dd9320769f3041ac1edca139496f14abe147d010/Emacs.org#python

(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

;(use-package pyvenv
;  :config
;  (pyvenv-mode 1))



;; XML
(require 'sgml-mode)

(defun reformat-xml ()
  (interactive)
  (save-excursion
    (sgml-pretty-print (point-min) (point-max))
    (indent-region (point-min) (point-max))))
