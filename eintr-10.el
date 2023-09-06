;;; Package --- Summary:
;;;
;;; Exercises for Emacs Introductory tutorial
;;;
;;; Commentary:
;;;
;; 10.3 Exercises with ‘yank’ and ‘nthcdr’
;; =======================================

;; • Using ‘C-h v’ (‘describe-variable’), look at the value of your kill
;; ring.  Add several items to your kill ring; look at its value
;; again.  Using ‘M-y’ (‘yank-pop)’, move all the way around the kill
;; ring.  How many items were in your kill ring?  Find the value of
;; ‘kill-ring-max’.  Was your kill ring full, or could you have kept
;; more blocks of text within it?

;; • Using ‘nthcdr’ and ‘car’, construct a series of expressions to
;; return the first, second, third, and fourth elements of a list.

;;; Code:

(setq trees (list "palm" "oak" "pine"))
(car trees)
(car (nthcdr 1 trees))
(car (nthcdr 2 trees))

;;; eintr-10.el ends here
