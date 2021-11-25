(load-theme 'tango-dark)
(require 'org)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files '("~/inbox.org"))
(setq ispell-program-name "/usr/local/bin/aspell")
(electric-pair-mode)
(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-S-tab] 'previous-buffer)
(delete-selection-mode t)
(add-to-list 'exec-path "/usr/local/bin/")
(display-time-mode 1)
(display-battery-mode 1)
(setq sentence-end-double-space nil)
(global-display-line-numbers-mode)
