
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . css-mode))

(add-hook 'css-mode-hook (lambda ()
                           (defineIndentFuncs)
						   (indent2)
						   (indent-with-spaces)
                           ))
;; More comment stuff is in init-comment.js

(provide 'init-css)
