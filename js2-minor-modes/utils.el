;; Minor modes add the list of valid global externs
;; Need a way to reset (short/medium term solution
(defun js2-minor-mode-remove-externs (toRemove)
  (interactive)
  (mapcar #'(lambda (item)
			  (setq js2-additional-externs (remove item js2-additional-externs)))
		  toRemove)
)

(defun js2-minor-mode-add-externs (toAdd)
  (interactive)
  (setq js2-additional-externs (remove-duplicates (append js2-additional-externs toAdd)))
)
