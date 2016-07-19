;;; Starting in the top left corner of a 2×2 grid, and only being able to move to
;;; the right and down, there are exactly 6 routes to the bottom right corner.
;;;
;;; [p015]
;;;
;;; How many such routes are there through a 20×20 grid?

(import (srfi :1))

(define (factorial x)
  (if (eqv? 1 x)
    1
    (* x (factorial (1- x)))))

(define (c a b)
  (/
    (reduce * 1
            (iota (- a b)
                  (1+ b)))
    (factorial b)))

(display
  (c 40 20))
