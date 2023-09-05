;;; Package --- Summary:
;;;
;;; Exercises for Emacs Introductory tutorial
;;;
;;; Commentary:
;;;
;; 7.7 Exercise
;; ============

;; Construct a list of four birds by evaluating several expressions with
;; ‘cons’.  Find out what happens when you ‘cons’ a list onto itself.
;; Replace the first element of the list of four birds with a fish.
;; Replace the rest of that list with a list of other fish.

;;; Code:

(setq birds (cons "chicken"
                  (cons "cockatoo"
                        (cons "condor"
                              (cons "penguin" ())))))

(cons birds birds)

(setcar birds "shark")

(setcdr birds (list "salmon" "piranha" "anglerfish"))

;;; eintr-7.el ends here
