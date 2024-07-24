;;; Package --- Summary:  -*- lexical-binding: t; -*-
;;;
;;; Exercises for Emacs Introductory tutorial
;;;
;;; Commentary:
;;;
;;; Test with
;;;
;;; emacs -batch -l ert -l eintr-12.el -f ert-run-tests-batch-and-exit
;;;
;;; 12.6 Exercises with ‘re-search-forward’
;;; =======================================
;;;
;;;    • Write a function to search for a regular expression that matches
;;;      two or more blank lines in sequence.
;;;
;;;    • Write a function to search for duplicated words, such as “the the”.
;;;      *Note Syntax of Regular Expressions: (Emacs)Regexps, for
;;;      information on how to write a regexp (a regular expression) to
;;;      match a string that is composed of two identical halves.  You can
;;;      devise several regexps; some are better than others.  The function
;;;      I use is described in an appendix, along with several regexps.
;;;      *Note ‘the-the’ Duplicated Words Function: the-the.
;;;
;;; Code:

(setq-local debug-on-error t)

(defun my/count (counts)
  "Search empty line and return the COUNTS if found."
       (re-search-forward "\n[ \t]*$")
       (1+ counts))

(defun my/regexp-blanks ()
  "Matches the first two or more blank lines in sequence in STR.  Fails."
  (interactive)
  (let ((score 0))
    (while (< score 2)
      (setq score (my/count score)))
    nil))

(ert-deftest test-my/regexp-blanks ()
  (with-temp-buffer
    (insert "oh\n\n  \n \nno")
    (goto-char 0)
    (my/regexp-blanks)))

(ert-deftest test-my/regexp-blanks-end ()
  (with-temp-buffer
    (insert "oh\n  \n ")
    (goto-char 0)
    (my/regexp-blanks)))

(ert-deftest test-my/regexp-blanks-failure ()
    "If no match is found, it fails."
    :expected-result
    :failed
    (with-temp-buffer
      (insert "oh\n  \n no")
      (goto-char 0)
      (my/regexp-blanks)))

;;; eintr-12.el ends here
