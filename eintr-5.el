;;; Package --- Summary:
;;;
;;; Exercises for Emacs Introductory tutorial
;;;
;;; Commentary:
;;;
;;;
;;;

;;; Code:

;;; 5.5

(defun my/is-greater-or-equal-to-fill-column (&optional arg)
  "Test whether ARG is greater than, equal or less than \\[fill-column].
Return a message stating which.  If no ARG is given, use 56 as its value."
  (interactive "P")
  (let* ((argument (or (prefix-numeric-value arg) 56))
         (compared-to (cond ((= argument fill-column) "equal to")
                            ((> argument fill-column) "greater than")
                            (t "smaller than"))))
    (message "%s is %s %s" argument compared-to fill-column)))

;;; eintr-5.el ends here
