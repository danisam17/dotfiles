(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")

(setq default-directory "/Users/kristian" )

(load "00common-setup.el")
(load "01auto-complete.el")
(load "02smartparens.el")
(load "03projectile.el")
(load "04highlight-indentation.el")
(load "05flyspell.el")
(load "06emmet.el")
(load "07ruby.el")
(load "08org-mode.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
