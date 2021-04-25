(setq comment-empty-lines t)
(defun return0 () 0)
(setq comment-indent-function 'return0)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (let ((tmp-string "a")
        (empty-line (= (line-beginning-position) (line-end-position)))
        )
    ;; empty lines weren't commented by this...
    (when empty-line (insert tmp-string))
    (comment-or-uncomment-region
     (line-beginning-position)
     (line-end-position))
    (when empty-line (delete-backward-char (string-width tmp-string)))
))

;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

(defun mpa-comment-line (numLines)
  (interactive "P")
  (when (not numLines) (setq numLines 1))
  (let ((cnt 0))
	(while (> numLines cnt)
	  (setq cnt (+ cnt 1))
	  (toggle-comment-on-line)
	  (forward-line 1)
	  )
	))

(defun mpa-comment-or-uncomment-region (beg end &optional arg)
  (interactive "*r\nP")
  (if (use-region-p)
	  (save-excursion
		(goto-char beg)
		(setq beg (point-at-bol))
		(goto-char end)
		(setq end (point-at-eol))
		)
	(save-excursion
	  (setq beg (point-at-bol))
	  (setq end (point-at-eol))
	  ))
  (comment-or-uncomment-region beg end arg)
  )

(global-set-key (kbd "C-/") 'mpa-comment-line)
(global-set-key (kbd "M-/") 'mpa-comment-or-uncomment-region)

;(global-set-key (kbd "C-.") 'comment-region)
(global-set-key (kbd "C-.")
                (lambda ()
                  (interactive)
                  ))

(global-set-key (kbd "C-b") 'mpa-beautify)

;(global-set-key (kbd "C-,") 'uncomment-region)

(provide 'init-comment)
