;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; json-mode
(add-to-list 'load-path "~/.emacs.d/json-mode")
(add-to-list 'load-path "~/.emacs.d/json-snatcher")
(add-to-list 'load-path "~/.emacs.d/json-reformat")
(autoload 'json-mode "json-mode" nil t)
(add-hook 'json-mode-hook (lambda () (setq js-indent-level 2)))
(add-to-list 'auto-mode-alist '("\\.json\\'"  . json-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use js2-mode for .js
(add-to-list 'load-path "~/.emacs.d/js2-mode")
(autoload 'js2-mode  "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'"  . js2-mode))

(defun defineIndentFuncs ()
  (defun mysetjsindent (num) 
    "sets the number of indents of the current buffer to the number"
    (cond
     ((eq major-mode 'json-mode)
      (setq js-indent-level num)
      )
     ((eq major-mode 'js2-mode)
      (setq js2-basic-offset num))
     ))
                           
  ;; functions to change the number of spaces on a tab
  (defun indent2 ()
    "change the current buffer to 2 space indent"
    (interactive)
    (mysetjsindent 2)
    )
  (defun indent4 () 
    "change the current buffer to 4 space indent"
    (interactive)
    (mysetjsindent 4)
    )
)

(add-hook 'json-mode-hook (lambda () 
                           (defineIndentFuncs)
                           ))

(add-hook 'js2-mode-hook (lambda () 
                           (require 'js-doc)
                           (require 'js2-imenu-extras)
                           (js2-imenu-extras-mode)
                           (defineIndentFuncs)
                           (add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
                           (local-set-key "\C-ci" 'js-doc-insert-function-doc)
                           (local-set-key "\C-c@" 'js-doc-insert-tag)
                           (local-set-key "\C-cf" 'js-doc-insert-file-doc)
                           (local-set-key (kbd "RET") (key-binding (kbd "M-j")))
                           (setq-default js2-global-externs '(
                                                              "module" "exports" "require" "__dirname" 
                                                              "setTimeout" "clearTimeout" "setInterval" "clearInterval" 
                                                              "assert" "refute" 
                                                              "$" "_"
                                                              "describe" "ddescripe" "xdescribe"
                                                              "it" "iit" "xit"
                                                              "beforeEach" "afterEach"
                                                              "location" "console" "JSON"))
                           ;; make it so that indention params can be set for individual buffers
                           (make-variable-buffer-local 'js2-basic-offset)
                           (make-variable-buffer-local 'js2-indent-chained)
                           '(js2-auto-insert-semicolon t)
                           '(js2-basic-offset 4)
                           '(js2-bounce-indent-p nil)
                           (setq javascript-indent-level 4
                                 javascript-expr-indent-offset 4
                                 js2-basic-offset 4
                                 js2-indent-chained nil
                                 )
                           ))


(provide 'init-javascript)
