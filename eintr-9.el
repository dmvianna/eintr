;;; Package --- Summary:
;;;
;;; Exercises for Emacs Introductory tutorial
;;;
;;; Commentary:
;;;
;; 9.2 Exercise
;; ============

;; Set ‘flowers’ to ‘violet’ and ‘buttercup’.  Cons two more flowers on to
;; this list and set this new list to ‘more-flowers’.  Set the CAR of
;; ‘flowers’ to a fish.  What does the ‘more-flowers’ list now contain?

;;; Code:

(setq flowers (cons "violet" (cons "buttercup" nil)))
(setq more-flowers (cons "rose" (cons "daisy" flowers)))
(setcar flowers "swordfish")

;;; eintr-9.el ends here
