;;; A permutation is an ordered arrangement of objects. For example, 3124 is one
;;; possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
;;; are listed numerically or alphabetically, we call it lexicographic order. The
;;; lexicographic permutations of 0, 1 and 2 are:
;;;
;;; 012   021   102   120   201   210
;;;
;;; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5,
;;; 6, 7, 8 and 9?

(import (srfi :1))

(define (factorial x)
  (if (<= x 1)
    1
    (* x (factorial (1- x)))))

(define (permutation-ref lst n)
  (let* ((lst-length (length lst))
         (m (factorial (1- lst-length)))
         (index (floor/ n m))
         (value (list-ref lst index)))
    (if (< lst-length 2)
      lst
      (cons value
            (permutation-ref (delv value lst)
                             (- n (* m index)))))))



(display
  (fold (lambda (a b)
          (+ a (* 10 b)))
        0
        (permutation-ref (iota 10) 999999)))
