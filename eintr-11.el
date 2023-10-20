;;; Package --- Summary:
;;;
;;; Exercises for Emacs Introductory tutorial
;;;
;;; Commentary:
;;;

;; 11.4 Looping Exercise
;; =====================

;; • Write a function similar to ‘triangle’ in which each row has a
;; value which is the square of the row number.  Use a ‘while’ loop.

;;; Code:

;; • Write a function similar to ‘triangle’ that multiplies instead of
;; adds the values.

(defun multiply-by-total (number-of-rows)
  "Total pebbles in a pyramid.
Each row contains the total count of pebbles multiplied
by the NUMBER-OF-ROWS so far."
  (let ((total 1)
        (row-number 1))
    (while (<= row-number number-of-rows)
      (setq total (* total row-number))
      (setq row-number (1+ row-number)))
    total))

(ert-deftest test-multiply-by-total ()
  "Tests `multiply-by-total' results."
  (should (equal (multiply-by-total 1) 1))
  (should (equal (multiply-by-total 2) 2))
  (should (equal (multiply-by-total 3) 6)))

;; • Rewrite these two functions recursively.  Rewrite these functions
;; using ‘cond’.

(defun multiply-by-total-recursively (number-of-rows &optional total)
  "Total pebbles in a pyramid.
Each row contains the total count of pebbles multiplied
by the NUMBER-OF-ROWS so far.  Optionally set initial TOTAL."
  (let ((total (if total total 1))
        (row-number 1))
    (cond
     ((= number-of-rows 1) 1)
     ((> number-of-rows 1)
      (* number-of-rows
         (multiply-by-total-recursively (1- number-of-rows) total))))))

(ert-deftest test-multiply-by-total-recursively ()
  "Tests `multiply-by-total-recursively' results."
  (should (equal (multiply-by-total-recursively 1) 1))
  (should (equal (multiply-by-total-recursively 2) 2))
  (should (equal (multiply-by-total-recursively 3) 6)))

;; • Write a function for Texinfo mode that creates an index entry at
;; the beginning of a paragraph for every ‘@dfn’ within the paragraph.
;; (In a Texinfo file, ‘@dfn’ marks a definition.  This book is
;;     written in Texinfo.)

;; Many of the functions you will need are described in two of the
;; previous chapters, *note Cutting and Storing Text: Cutting &
;; Storing Text, and *note Yanking Text Back: Yanking.  If you use
;; ‘forward-paragraph’ to put the index entry at the beginning of the
;; paragraph, you will have to use ‘C-h f’ (‘describe-function’) to
;; find out how to make the command go backwards.

;; For more information, see *note Indicating Definitions:
;; (texinfo)Indicating.

;;; eintr-11.el ends here
