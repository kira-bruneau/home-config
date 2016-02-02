(require-package
 '(adaptive-wrap
   monokai-theme
   powerline
   linum-off))

(load-theme 'monokai t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(vertical-border ((t (:foreground "#1f1f1b")))))

;; Powerline mode
(powerline-default-theme)

;; GUI cleanup
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Start frames maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Line numbers
(require 'linum-off)
(global-linum-mode)
(setq linum-format " %d ")

;; Misc
(setq-default tab-width 4)
(setq column-number-mode t)
(show-paren-mode t)
(setq-default word-wrap t)
(add-hook 'visual-line-mode-hook 'adaptive-wrap-prefix-mode)
(setq-default cursor-type '(bar . 2)) ;; 2px since I have a high dpi monitor
(blink-cursor-mode t)

(provide 'setup-ui)
