;;; Package --- Summary:
;;;
;;; Exercises for Emacs Introductory tutorial
;;;
;;; Commentary:
;;;
;; 8.7 Searching Exercises
;; =======================

;; • Write an interactive function that searches for a string.  If the
;; search finds the string, leave point after it and display a message
;; that says “Found!”.  (Do not use ‘search-forward’ for the name of
;;                          this function; if you do, you will overwrite the existing version
;;                          of ‘search-forward’ that comes with Emacs.  Use a name such as
;;                          ‘test-search’ instead.)

;; • Write a function that prints the third element of the kill ring in
;; the echo area, if any; if the kill ring does not contain a third
;; element, print an appropriate message.


;;; Code:

(defun test-search ()
  "Leave the point after the word being searched."
  (message "Found!"))

(defun third-element ()
  "Display the third element of the kill ring."
  (interactive)
  (if (< (length kill-ring) 3)
      (message "Kill-ring is too short!")
    (message (car (nthcdr 3 kill-ring)))))

;;; eintr-8.el ends here
