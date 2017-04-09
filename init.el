
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq-default indent-tabs-mode t)
(setq-default tab-width 2)

(add-to-list 'load-path "~/.emacs.d/")

(message "Loading beautify functions");
;; my kbd definitions
(fset 'getem
   [?\C-s ?\C-s ?\C-a ?\C-k ?\C-k ?\C-r ?\C-r down ?\C-a ?\C-y])
(fset 'expand
   [?\C-a ?^ ?\C-r ?^ ?\C-r right ?\C-k ?\C-y ?\C-s ?^ ?\C-m ?\C-x ?b ?* ?f ?o ?r ?e ?x ?p ?a ?n ?d ?* return ?\C-y ?\M-l ?1 return ?\C-x ?b return ?\C-k backspace ?\C-x ?b return escape ?x ?r ?e ?p ?l ?  ?s return ?# return ?\C-y return ?\C-a ?\C-k ?\C-x ?k return ?\C-y down ?\C-a])


(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "C-l") 'recenter)

(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

(require 'init-beautify)
(require 'init-comment)
(require 'init-javascript)
(require 'init-perl)
(require 'init-lisp)
(require 'init-web)
(require 'init-css)

(add-to-list 'load-path "~/.emacs.d/async")
(add-to-list 'load-path "~/.emacs.d/helm");

; (require 'helm-config)

;(require 'ido)
;(ido-mode t);
(put 'downcase-region 'disabled nil)
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

(put 'upcase-region 'disabled nil)
