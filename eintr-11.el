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

;; ert tests can be run using M-x ert-run-tests-interactively
(ert-deftest test-multiply-by-total ()
  "Tests `multiply-by-total' results."
  (should (equal (multiply-by-total 1) 1))
  (should (equal (multiply-by-total 2) 2))
  (should (equal (multiply-by-total 3) 6)))

;; • Rewrite these two functions recursively.  Rewrite these functions
;; using ‘cond’.

(defun multiply-by-total-recursively
    (number-of-rows &optional counter total)
  "Total pebbles in a pyramid.
Each row contains the total count of pebbles multiplied by the
NUMBER-OF-ROWS so far.  Optionally set initial COUNTER and TOTAL."
  (let ((total (if total total 1))
        (counter (if counter counter 1)))
    (cond
     ((> counter number-of-rows) total)
     (t
      (multiply-by-total-recursively
       number-of-rows
       (1+ counter)
       (* counter total))))))

;; ert tests can be run using M-x ert-run-tests-interactively
(ert-deftest test-multiply-by-total-recursively ()
  "Tests `multiply-by-total-recursively' results."
  (should (equal (multiply-by-total-recursively 1) 1))
  (should (equal (multiply-by-total-recursively 2) 2))
  (should (equal (multiply-by-total-recursively 3) 6)))

;; • Write a function for Texinfo mode that creates an index entry at
;; the beginning of a paragraph for every ‘@dfn’ within the paragraph.
;; (In a Texinfo file, ‘@dfn’ marks a definition.  This book is
;;     written in Texinfo.)
;;
;; Many of the functions you will need are described in two of the
;; previous chapters, *note Cutting and Storing Text: Cutting &
;; Storing Text, and *note Yanking Text Back: Yanking.  If you use
;; ‘forward-paragraph’ to put the index entry at the beginning of the
;; paragraph, you will have to use ‘C-h f’ (‘describe-function’) to
;; find out how to make the command go backwards.

;; 1. narrow to a target paragraph
;; 2. save-excursion: we don't want to change the paragraph itself
;;    and need to return to beginning of paragraph.
;; 3. search-forward regex
;; 4. drop mark
;; 5. search-backward regex
;; 6. copy text
;; 7. add text to index text
;; 8. goto mark
;; 9. continue from 3. until we get to point-max
;; 10. add index to point-min
;; 11. reset narrowing and set to next paragraph.
;; 12. If we're at point-max of unnarrowed buffer, done.
;;

(defun re-seq (regexp string &optional num)
  "Get a list of all REGEXP matches in a STRING.
Optionally choose which NUM regex parenthesised
sub-expression to return."
  (save-match-data
    (let ((pos 0)
          matches)
      (while (string-match regexp string pos)
        (push (match-string num string) matches)
        (setq pos (match-end 0)))
      matches)))

(ert-deftest test/re-seq ()
  "Tests `re-seq'."
  (should (equal (re-seq "@dfn{\\(.+\\)}" "@dfn{haha}" 1) '("haha"))))

(defun my/index-texinfo-dfn ()
  "Create an index entry for every @dfn in a paragraph, recursively.
One paragraph."
  (interactive)
  (let ((beg-paragraph (point))
        (end-paragraph)
        (matches))
    (forward-paragraph)
    (setq end-paragraph (point))
    (message (format "%s %s" beg-paragraph (point)))
    (with-restriction beg-paragraph end-paragraph
      (setq matches
            (re-seq "@dfn{\\(.+\\)}" (buffer-string) 1)))
    (goto-char beg-paragraph)
    (skip-chars-forward "[:blank:]\n")
    (dolist (elt (reverse matches))
      (insert (concat "@cindex " elt "\n")))
    (if matches (insert "\n"))
    (forward-paragraph)))

(defun my/index-texinfo-paragraph ()
  "Read a PARAGRAPH and insert index of texinfo @dfn before it.
Buffer-wide."
  (interactive)
  (while (< (point) (point-max))
    (my/index-texinfo-dfn)))

;; For more information, see *note Indicating Definitions:
;; (texinfo)Indicating.

;;; eintr-11.el ends here
