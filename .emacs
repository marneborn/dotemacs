
(setq-default indent-tabs-mode nil)
(add-to-list 'load-path "~/.emacs.d/")
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "C-l") 'recenter)

(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

;;;; Stuff related to js2-mode
(autoload 'js2-mode "js2-mode" nil t)

;; use js2-mode for .js and .json
(add-to-list 'auto-mode-alist '("\\.js\\(?:on\\)?\\'"  . js2-mode))

;; default to space for tab and 4 space
(custom-set-variables
 '(js2-auto-insert-semicolon t)
 '(js2-basic-offset 4)
 '(js2-bounce-indent-p nil)
 '(js2-enter-indents-newline t)
 '(js2-indent-on-enter-key t)
 )


;; functions to change the number of spaces on a tab
(defun indent2 () 
  "change the current buffer to 2 space indent"
  (interactive)
  (message "making buffer %s indent2" (buffer-name))
  (setq js2-basic-offset 2)
  )
(defun indent4 ()
  "change the current buffer to 4 space indent"
  (interactive)
  (message "making buffer %s indent4" (buffer-name))
  (setq js2-basic-offset 4)
  )

;; check if a string ends-with another string;
(defun string/ends-with (string suffix)
  "Return t if STRING ends with SUFFIX."
  (and (string-match (rx-to-string `(: ,suffix eos) t)
                     string)
       t)
  )

;
(add-hook 'js2-mode-hook (lambda () 
                           (require 'js-doc)
                           (make-variable-buffer-local 'js2-basic-offset)
                           (if (string/ends-with (buffer-name) ".json")
                               (setq js2-basic-offset 2) (setq js2-basic-offset 4)
                               )
                           (local-set-key "\C-ci" 'js-doc-insert-function-doc)
                           (local-set-key "\C-c@" 'js-doc-insert-tag)
                           (local-set-key "\C-cf" 'js-doc-insert-file-doc)
                           (local-set-key (kbd "RET") (key-binding (kbd "M-j")))
                           (setq js2-additional-externs '("console" "jQuery" "$" "goog" "describe" "it" "before" "beforeEach" "after" "afterEach" "assert" ))
                           (setq javascript-indent-level 2
                                 javascript-expr-indent-offset 2
                                 indent-tabs-mode nil)
                           )
          )


;;;;;;;;
;; custom keyboard macros
(fset 'beautify
   [escape ?x ?s ?e ?a ?r ?c ?h ?- ?f ?o ?r ?w ?a ?r ?d ?- ?r ?e ?g ?e ?x ?p  return ?\[ ?a ?- ?z ?\\ ?\{ ?\\ ?\} ?\\ ?/ ?\\ ?\; ?\] return ?\C-a tab down ?\C-a])




;;;;;;;;;;

;; js2-mode

;(js2r-add-keybindings-with-prefix "C-c C-m")

    

