;;; Package --- Summary:
;;;
;;; Exercises for Emacs Introductory tutorial
;;;
;;; Commentary:
;;;
;;;
;;;

;;; Code:

(defun simplified-end-of-buffer ()
  "Move point to the end of the buffer;
leave mark at previous position."
  (interactive)
  (push-mark)
  (goto-char (point-max)))


(defun does-buffer-exist? (buffer)
  "Prints a message telling whether a BUFFER exists."
  (interactive (list (read-buffer "Buffer: " (current-buffer))))
  (let ((maybe (if (get-buffer buffer) "" "not ")))
    (message "Buffer %s does %sexist." buffer maybe)))

(provide 'eintr-4)
;;; eintr-4.el ends here
