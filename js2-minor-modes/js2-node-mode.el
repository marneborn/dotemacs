;; Creating a minor mode for node within js2-mode
;; Need custom j2-mode that makes js2-reparse interactive though...

(defcustom js2-node-mode nil
  "Variable saying whether or not we're in js2-node-mode"
  :type 'boolean
  )

(defvar js2-node-mode-additional-externs
  (mapcar 'symbol-name
          '())
  "Node.js externs not in js2-mode")

(defun j2s-node-mode-enter ()
  (setq js2-additional-externs
		(append 
		 js2-node-mode-additional-externs 
		 js2-node-externs 
		 js2-harmony-externs
		 ))
  (js2-reparse t)
  )

(defun j2s-node-mode-exit ()
  (setq js2-additional-externs '())
  (js2-reparse t)
  )

(define-minor-mode js2-node-mode
  "Toggle js2-node-mode
Setup js2-mode for node"
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " Node"
  ;; The minor mode bindings.
  :keymap nil

  (if js2-node-mode
	  (j2s-node-mode-enter)
	(j2s-node-mode-exit)
	)
  )


