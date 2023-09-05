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

(defun my/test-search (count text)
  "Leave the point after the TEXT being searched.
Always searches from the beginning of the accessible region.
Optionally skip COUNT occurrences.  If COUNT is negative,
reverse searches from the end of the accessible region."
  (interactive "p\nsTarget text: ")
  (goto-char (if (< count 0) (point-max) (point-min)))
  (if (search-forward text nil t count)
      (message "Found!")
    (message "Not found: %s" text)))

(defun my/third-element ()
  "Display the third element of the kill ring."
  (interactive)
  (if (< (length kill-ring) 3)
      (message "Kill-ring is too short!")
    (message (car (nthcdr 3 kill-ring)))))

;;; eintr-8.el ends here
(search-forward "hoho" nil (message "not found"))
