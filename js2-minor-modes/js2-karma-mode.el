;; Creating a minor mode for karma within js2-mode
;; Need custom j2-mode that makes js2-reparse interactive though...

(require 'js2-node-mode)

(defcustom js2-karma-mode nil
  "Variable saying whether or not we're in js2-karma-mode"
  :type 'boolean
  )

(defvar js2-karma-mode-additional-externs
  (mapcar 'symbol-name
          '(
			browser element by inject
			))
  "Karma externs not in js2-mode")

(defun js2-karma-mode-enter ()
  (interactive)
  (js2-node-mode-enter)
  (setq js2-additional-externs
		(append
		 js2-additional-externs
		 js2-karma-mode-additional-externs
		))
  (js2-reparse t)
  )

(defun js2-karma-mode-exit ()
  (setq js2-additional-externs '())
  (js2-reparse t)
  )

(define-minor-mode js2-karma-mode
  "Toggle js2-karma-mode
Setup js2-mode for karma"
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " Karma"
  ;; The minor mode bindings.
  :keymap nil

  (if js2-karma-mode
	  (js2-karma-mode-enter)
	(js2-karma-mode-exit)
	)
  )

(provide 'js2-karma-mode)
