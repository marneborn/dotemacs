(message "here!!!");
(load "~/.emacs.d/kbd-macros.el")
(load "~/.emacs.d/kbd-shortcuts.el")

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(add-to-list 'load-path "~/.emacs.d")

(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

(require 'init-beautify)
(require 'init-comment)
(require 'init-javascript)
(require 'init-perl)
(require 'init-lisp)
(require 'init-web)
(require 'init-css)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

