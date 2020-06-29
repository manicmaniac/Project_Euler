;;; The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
;;; number, 134217728=8^9, is a ninth power.
;;;
;;; How many n-digit positive integers exist which are also an nth power?

(import (ice-9 match)
        (srfi :1))

(define digits-length
  (compose 1+
           inexact->exact
           floor
           log10))

(define (cartesian-product . lists)
  (fold-right (lambda (xs ys)
                (append-map (lambda (x)
                              (map (lambda (y)
                                     (cons x y))
                                   ys))
                            xs))
              '(())
              lists))

(display
  (count (match-lambda ((x y)
                        (= y (digits-length (expt x y)))))
         (cartesian-product (iota 9 1)
                            (iota 21 1))))
(newline)
