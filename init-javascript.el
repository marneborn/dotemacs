;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; json-mode
(add-to-list 'load-path "~/.emacs.d/json-mode")
(add-to-list 'load-path "~/.emacs.d/json-snatcher")
(add-to-list 'load-path "~/.emacs.d/json-reformat")
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
(add-to-list 'load-path "~/.emacs.d/jshint-mode")
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
     (lambda () (flymake-mode t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load minor modes
(add-to-list 'load-path "~/.emacs.d/js2-minor-modes")
(require 'js2-node-mode)
(require 'js2-browser-mode)
(require 'js2-jasmine-mode)
(require 'js2-karma-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use js2-mode for .js
(add-to-list 'load-path "~/.emacs.d/js2-mode")
(autoload 'js2-mode  "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'"  . js2-mode))

;; should I move these into `js2-additional-externs' or `js2-default-externs',
;; moving externs to minor modes, remove from here as modes are created
(setq-default js2-global-externs '(
								   "assert" "refute"
								   "angular" "protractor"
								   "google"
								   "$" "$$" "_"
								   "location" "localStorage"
								   )
			  )

;; Go into jasmine mode for anything that is .spec.js
(defun turn-on-jasmine-mode-hook ()
  (cond ((string-match ".spec.js" buffer-file-name)
         (js2-jasmine-mode 1)
		 )))
(add-hook 'js2-mode-hook 'turn-on-jasmine-mode-hook)


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

						   ;; node mode by default
						   (if (string-match ".spec.js" buffer-file-name)
							   (js2-jasmine-mode 1)
							 (js2-node-mode 1)
							 )))

(provide 'init-javascript)
