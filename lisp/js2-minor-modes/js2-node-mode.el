;; Creating a minor mode for node within js2-mode
;; Need custom j2-mode that makes js2-reparse interactive though...

(defcustom js2-node-mode nil
  "Variable saying whether or not we're in js2-node-mode"
  :type 'boolean
  )

(defvar js2-node-mode-additional-externs
  (mapcar 'symbol-name
          '()
		  )
  "Node externs not in js2-mode")

(defun js2-node-mode-enter ()
  (js2-browser-mode 0)
  (js2-minor-mode-add-externs js2-node-mode-additional-externs)
  (js2-minor-mode-add-externs js2-node-externs)
  (js2-minor-mode-add-externs js2-harmony-externs)
  (js2-reparse t)
  )

(defun js2-node-mode-exit ()
  (js2-minor-mode-remove-externs js2-node-mode-additional-externs)
  (js2-minor-mode-remove-externs js2-node-externs)
  (js2-minor-mode-remove-externs js2-harmony-externs)
  (js2-reparse t)
  )

(define-minor-mode js2-node-mode
  "Toggle js2-node-mode"
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " Node"
  ;; The minor mode bindings.
  :keymap nil

  (if js2-node-mode
	  (js2-node-mode-enter)
	(js2-node-mode-exit)
	)
  )

(provide 'js2-node-mode)
