;; set font
(set-default-font "Operator Mono-14")

;; http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/Dropbox/org/kristian.org"))
(setq-default org-startup-indented t) ;; org-mode "clean" (indented)
