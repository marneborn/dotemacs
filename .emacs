
(setq-default indent-tabs-mode nil)
(add-to-list 'load-path "~/.emacs.d/")

;; my kbd definitions
(fset 'getem
   [?\C-s ?\C-s ?\C-a ?\C-k ?\C-k ?\C-r ?\C-r down ?\C-a ?\C-y])

(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "C-l") 'recenter)

(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

(require 'init-javascript)
(require 'init-perl)
(require 'init-lisp)
(require 'init-comment)
(require 'init-beautify)

(add-to-list 'load-path "~/.emacs.d/async")

(add-to-list 'load-path "~/.emacs.d/helm");
(require 'helm-config)

;(require 'ido)
;(ido-mode t);
