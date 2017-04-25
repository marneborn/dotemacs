(defun mpa-beautify-line ()
  (interactive)
  (if (comment-only-p (point-at-bol) (point-at-eol))
			(forward-line 1)
		(goto-char (point-at-bol))
		(indent-for-tab-command)
		(delete-trailing-whitespace (point-at-bol) (point-at-eol))
		(forward-line 1)
		)
  )

(defun mpa-beautify (beg end &optional arg)
  (interactive "*r\nP")
  (cond ((use-region-p)
         (goto-char beg)
         (let ((prev -1))
           (while (and (< (point) end) (/= prev (point)))
             (setq prev (point))
             (mpa-beautify-line)
             )))
        (t
         (when (not arg) (setq arg 1))
         (let ((cnt 0))
           (while (> arg cnt)
             (setq cnt (+ cnt 1))
             (mpa-beautify-line)
             )))))

(global-set-key (kbd "C-b") 'mpa-beautify)
(global-set-key (kbd "M-b") (lambda () (interactive) (mpa-beautify (point-min) (point-max))))

(global-set-key (kbd "C->") 'increase-left-margin)
(global-set-key (kbd "C-<") 'decrease-left-margin)

(defun defineIndentFuncs ()
  (defun mysetindent (num)
    "sets the number of indents of the current buffer to the number"
		(interactive)
		(message "Setting indent to %s" num);
    (cond
     ((eq major-mode 'json-mode)
			(setq tab-width num)
			(setq js-indent-level num)
			(setq json-reformat:indent-width num)
      )
     ((eq major-mode 'js2-mode)
			(setq tab-width num)
			(setq js2-basic-offset num)
			(setq javascript-indent-level num)
			(setq javascript-expr-indent-offset num)
      )
     ((eq major-mode 'web-mode)
      (setq web-mode-markup-indent-offset num)
      )
     ((eq major-mode 'css-mode)
			(setq css-indent-offset num)
			)
		 )
		)
	
  ;; switch bewteen space and tab inserts
  (defun indent-with-spaces ()
		"use spaces to indent"
		(interactive)
		(setq indent-tabs-mode nil)
		)
  (defun indent-with-tabs ()
		"use spaces to indent"
		(interactive)
		(setq indent-tabs-mode t)
		)
	
  ;; functions to change the number of spaces on a tab
  (defun indent2 ()
    "change the current buffer to 2 space indent"
    (interactive)
    (mysetindent 2)
    )
  (defun indent4 ()
    "change the current buffer to 4 space indent"
    (interactive)
    (mysetindent 4)
    )
  (defun indent8 ()
    "change the current buffer to 8 space indent"
    (interactive)
    (mysetindent 8)
    )
  )

(defineIndentFuncs)

;; FIXME - is this really needed? What's wrong with json-reformat?
(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e "python -mjson.tool" (current-buffer) t))
	)

(provide 'init-beautify)
