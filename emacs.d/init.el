;; melpa setup
;; https://melpa.org/#/getting-started
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; set theme
(load-theme 'tao-yin t)

;; set font
(set-default-font "Operator Mono-14")

;; http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/Dropbox/org/kristian.org"))
(setq-default org-startup-indented t) ;; org-mode "clean" (indented)

;; http://emacsredux.com/blog/2013/05/09/keep-backup-and-auto-save-files-out-of-the-way/
;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; helm
(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

;; projectile
(require 'projectile)
(projectile-global-mode)
(require 'helm-projectile)

;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; http://www.ftrain.com/util_emacs_hints.html
(defun insert-time ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d-%R")))
