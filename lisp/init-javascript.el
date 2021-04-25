;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; json-mode
(add-to-list 'load-path "~/.emacs.d/lisp/json-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/json-snatcher")
(add-to-list 'load-path "~/.emacs.d/lisp/json-reformat")
(autoload 'json-mode "json-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.json\\'"  . json-mode))

(add-hook 'json-mode-hook (lambda ()
                            (defineIndentFuncs)
														(indent2)
														(indent-with-spaces)
                            (setq mpa-comment-string "//")
                            ))

(load "json-reformat")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/lisp/jshint-mode")
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
					(lambda () (flymake-mode t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load minor modes
(add-to-list 'load-path "~/.emacs.d/lisp/js2-minor-modes")
(load-file "~/.emacs.d/lisp/js2-minor-modes/utils.el")
(require 'js2-node-mode)
(require 'js2-browser-mode)
(require 'js2-jasmine-mode)
(require 'js2-protractor-mode)
(require 'js2-karma-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use js2-mode for .js
(add-to-list 'load-path "~/.emacs.d/lisp/js2-mode")
(autoload 'js2-mode  "js2-mode" nil t)
(autoload 'js2-jsx-mode  "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'"  . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

;; toggle requiring semicolons
(defun js2-require-semi () 
  (interactive)
  (setq js2-strict-missing-semi-warning t)
  )
(defun js2-no-require-semi () 
  (interactive)
  (setq js2-strict-missing-semi-warning nil)
  )

;; toggle allowing commas after last item in array literal
(defun js2-allow-comma () 
  (interactive)
  (setq js2-strict-trailing-comma-warning nil)
  )
(defun js2-no-allow-comma ()
  (interactive)
  (setq js2-strict-trailing-comma-warning t)
  )

(defvar js2-custom-additional-externs
  (mapcar 'symbol-name
          '(
            async
            await
            ))
  "Externs not in js2-mode")

(add-hook 'js2-mode-hook (lambda ()
                           (message "in js2-mode")
                           (require 'js-doc)
                           (require 'js2-imenu-extras)
                           (js2-imenu-extras-mode)
                           (add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)) nil t)
                           (local-set-key "\C-ci" 'js-doc-insert-function-doc)
                           (local-set-key "\C-c@" 'js-doc-insert-tag)
                           (local-set-key "\C-cf" 'js-doc-insert-file-doc)
                           (local-set-key (kbd "RET") (key-binding (kbd "M-j")))

                           (set (make-local-variable 'js2-auto-insert-semicolon) t)
                           (set (make-local-variable 'js2-bounce-indent-p) nil)
                           (set (make-local-variable 'js2-basic-offset) 4)
                           (set (make-local-variable 'js2-indent-chained) nil)
                           (set (make-local-variable 'js2-strict-missing-semi-warning) nil)
                           (set (make-local-variable 'comment-style) 'plain)
                           (set (make-local-variable 'js-doc-description-line) " * Describe the function here\n")

													 ;; node mode by default, but jasmine if .spec.js
													 (if (string-match ".spec.js" buffer-file-name)
															 (js2-jasmine-mode 1)
														 (js2-node-mode 1)
														 )

                           (js2-minor-mode-add-externs js2-custom-additional-externs)
                           (defineIndentFuncs)
													 (indent2)
													 (indent-with-spaces)
                           (js2-no-require-semi)
                           (js2-allow-comma)
													 ))
(provide 'init-javascript)
