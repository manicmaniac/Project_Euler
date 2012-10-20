#|
If we list all the natural numbers below 10 that are multiples of 3 or 5, we
get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
|#

(define (loop n res)
  (if (< n 0)
    res
    (if (= 0 (* (remainder n 3) (remainder n 5)))
      (loop (- n 1) (+ n res))
      (loop (- n 1) res))))

(display (loop 999 0))

