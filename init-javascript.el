;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; json-mode
(add-to-list 'load-path "~/.emacs.d/json-mode")
(add-to-list 'load-path "~/.emacs.d/json-snatcher")
(add-to-list 'load-path "~/.emacs.d/json-reformat")
(autoload 'json-mode "json-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.json\\'"  . json-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use js2-mode for .js
(add-to-list 'load-path "~/.emacs.d/js2-mode")
(autoload 'js2-mode  "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'"  . js2-mode))

(add-hook 'json-mode-hook (lambda ()
                            (defineIndentFuncs)
							(indent2)
							(indent-with-spaces)
                            (setq mpa-comment-string "//")
                            ))

;; should I move these into `js2-additional-externs' or `js2-default-externs',
(setq-default js2-global-externs '(
								   "module" "exports" "require" "__dirname" "process"
								   "Buffer"
								   "setTimeout" "clearTimeout" "setInterval" "clearInterval"
								   "assert" "refute"
								   "angular"
								   "google"
								   "$" "$$" "_"
								   "browser" "element" "by"
								   "jasmine" "expect"
								   "describe" "ddescribe" "xdescribe" "fdescribe"
								   "it" "iit" "xit" "fit"
								   "beforeEach" "afterEach"
								   "spyOn"
								   "inject"
								   "location" "console" "JSON" "localStorage"
								   )
			  )

(add-hook 'js2-mode-hook (lambda ()
                           (require 'js-doc)
                           (require 'js2-imenu-extras)
                           (js2-imenu-extras-mode)
                           (defineIndentFuncs)
						   (indent4)
						   (indent-with-spaces)
                           (add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)) nil t)
                           (local-set-key "\C-ci" 'js-doc-insert-function-doc)
                           (local-set-key "\C-c@" 'js-doc-insert-tag)
                           (local-set-key "\C-cf" 'js-doc-insert-file-doc)
                           (local-set-key (kbd "RET") (key-binding (kbd "M-j")))

                           (set (make-local-variable 'js2-auto-insert-semicolon) t)
                           (set (make-local-variable 'js2-bounce-indent-p) nil)
                           (set (make-local-variable 'js2-basic-offset) 4)
                           (set (make-local-variable 'js2-indent-chained) nil)
                           (set (make-local-variable 'comment-style) 'plain)
                           (set (make-local-variable 'js-doc-description-line) " * Describe the function here\n")
                           ))


(provide 'init-javascript)
