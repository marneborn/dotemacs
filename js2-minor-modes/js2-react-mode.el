;; Creating a minor mode for react within js2-mode
;; Need custom j2-mode that makes js2-reparse interactive though...

(defcustom js2-react-mode nil
  "Variable saying whether or not we're in js2-react-mode"
  :type 'boolean
  )

(defvar js2-react-mode-externs
  (mapcar 'symbol-name
          '(
            React
            )
		  )
  "React externs not in js2-mode")

(defun js2-react-mode-enter ()
  (interactive)
  (js2-node-mode 0)
  (js2-minor-mode-add-externs js2-react-mode-externs)
  (js2-minor-mode-add-externs js2-react-mode-externs)
  (js2-minor-mode-add-externs js2-harmony-externs)
  (js2-reparse t)
  )

(defun js2-react-mode-exit ()
  (js2-minor-mode-remove-externs js2-react-mode-externs)
  (js2-minor-mode-remove-externs js2-react-mode-externs)
  (js2-minor-mode-remove-externs js2-harmony-externs)
  (js2-reparse t)
  )

(define-minor-mode js2-react-mode
  "Toggle js2-react-mode
Setup js2-mode for react"
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " React"
  ;; The minor mode bindings.
  :keymap nil

  (if js2-react-mode
	  (js2-react-mode-enter)
	(js2-react-mode-exit)
	)
  )

(provide 'js2-react-mode)
