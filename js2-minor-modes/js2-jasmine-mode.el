;; Creating a minor mode for jasmine within js2-mode
;; Need custom j2-mode that makes js2-reparse interactive though...

(defcustom js2-jasmine-mode nil
  "Variable saying whether or not we're in js2-jasmine-mode"
  :type 'boolean
  )

(defvar js2-jasmine-mode-additional-externs
  (mapcar 'symbol-name
          '(
			jasmine
			expect
			describe xdescribe fdescribe
			it xit fit
			beforeEach beforeAll afterEach afterAll
			spyOn
			))
  "Jasmine externs not in js2-mode")

(defun j2s-jasmine-mode-enter ()
  (setq js2-additional-externs
		(append
		 js2-node-mode-additional-externs
		 js2-jasmine-mode-additional-externs
		 js2-node-externs
		 js2-harmony-externs
		))
  (js2-reparse t)
  )

(defun j2s-jasmine-mode-exit ()
  (setq js2-additional-externs '())
  (js2-reparse t)
  )

(define-minor-mode js2-jasmine-mode
  "Toggle js2-jasmine-mode
Setup js2-mode for jasmine"
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " Jasmine"
  ;; The minor mode bindings.
  :keymap nil

  (if js2-jasmine-mode
	  (j2s-jasmine-mode-enter)
	(j2s-jasmine-mode-exit)
	)
  )


