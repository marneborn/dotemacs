(add-to-list 'auto-mode-alist '("\\.p[lm]\\'"  . cperl-mode))
(add-hook 'cperl-mode-hook (lambda ()
                              (set (make-local-variable 'comment-style) 'plain)
                              ))

(provide 'init-perl)
