
(setq-default indent-tabs-mode nil)
(add-to-list 'load-path "~/.emacs.d/")
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "C-l") 'recenter)

(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

(require 'init-javascript)

(add-to-list 'load-path "~/.emacs.d/async")
    
(add-to-list 'load-path "~/.emacs.d/helm");
(require 'helm-config)

;(require 'ido)
;(ido-mode t);

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom keyboard macros
(fset 'beautify
   [escape ?x ?s ?e ?a ?r ?c ?h ?- ?f ?o ?r ?w ?a ?r ?d ?- ?r ?e ?g ?e ?x ?p  return ?\[ ?a ?- ?z ?\\ ?\{ ?\\ ?\} ?\\ ?/ ?\\ ?\; ?\] return ?\C-a tab down ?\C-a])

