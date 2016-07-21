;; Creating a minor mode for browser within js2-mode
;; Need custom j2-mode that makes js2-reparse interactive though...

(defcustom js2-browser-mode nil
  "Variable saying whether or not we're in js2-browser-mode"
  :type 'boolean
  )

(defvar js2-browser-mode-externs
  (mapcar 'symbol-name
          '(
			))
  "Browser externs not in js2-mode")

(defun js2-browser-mode-enter ()
  (interactive)
  (setq js2-additional-externs js2-browser-mode-externs)
  (js2-reparse t)
  )

(defun js2-browser-mode-exit ()
  (setq js2-additional-externs '())
  (js2-reparse t)
  )

(define-minor-mode js2-browser-mode
  "Toggle js2-browser-mode
Setup js2-mode for browser"
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " Browser"
  ;; The minor mode bindings.
  :keymap nil

  (if js2-browser-mode
	  (js2-browser-mode-enter)
	(js2-browser-mode-exit)
	)
  )

(provide 'js2-browser-mode)
