(require 'projectile-rails)
(projectile-global-mode) ;; not sure about this
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(provide 'init-rails)
