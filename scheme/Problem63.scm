;;; The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
;;; number, 134217728=8^9, is a ninth power.
;;;
;;; How many n-digit positive integers exist which are also an nth power?

(import (srfi :1))

(define (ndigits x)
  (inexact->exact (1+ (floor (log10 x)))))

(display
  (count identity
         (concatenate
           (map (lambda (a)
                  (map (lambda (b)
                         (eqv? b (ndigits (expt a b))))
                       (iota 21 1)))
                (iota 9 1)))))
(newline)
