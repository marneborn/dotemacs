;; Creating a minor mode for protractor within js2-mode
;; Need custom j2-mode that makes js2-reparse interactive though...

(defcustom js2-protractor-mode nil
  "Variable saying whether or not we're in js2-protractor-mode"
  :type 'boolean
  )

(defvar js2-protractor-mode-additional-externs
  (mapcar 'symbol-name
          '(
			browser
			))
  "Protractor externs not in js2-mode")

(defun js2-protractor-mode-enter ()
  (interactive)
  (js2-node-mode 1)
  (js2-minor-mode-add-externs js2-protractor-mode-additional-externs)
  (js2-reparse t)
  )

(defun js2-protractor-mode-exit ()
  (js2-minor-mode-remove-externs js2-protractor-mode-additional-externs)
  (js2-reparse t)
  )

(define-minor-mode js2-protractor-mode
  "Toggle js2-protractor-mode"
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " Protractor"
  ;; The minor mode bindings.
  :keymap nil

  (if js2-protractor-mode
	  (js2-protractor-mode-enter)
	(js2-protractor-mode-exit)
	)
  )

(provide 'js2-protractor-mode)

