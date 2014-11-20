(add-to-list 'auto-mode-alist '("\\.el\\'"  . emacs-lisp-mode))
(add-hook 'emacs-lisp-mode-hook (lambda ()
                              (set (make-local-variable 'comment-style) 'plain)
                              ))

(provide 'init-lisp)
