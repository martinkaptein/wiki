(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-display-line-numbers-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'tango-dark)
(require 'org)
(define-key global-map "\C-ca" 'org-agenda)
(electric-pair-mode)
(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-S-tab] 'previous-buffer)
(delete-selection-mode t)
(display-time-mode 1)
(display-battery-mode 1)
(setq sentence-end-double-space nil)
(global-display-line-numbers-mode)
(put 'dired-find-alternate-file 'disabled nil)

;; os specific (paths)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq org-agenda-files '("~/inbox.org"))
(setq ispell-program-name "/usr/local/bin/aspell")
(add-to-list 'exec-path "/usr/local/bin/")


;; org mode optimized
(setq inhibit-splash-screen t)
(org-agenda-list)
(delete-other-windows)

;; keys
