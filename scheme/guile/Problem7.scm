;;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
;;; the 6th prime is 13.
;;;
;;; What is the 10 001st prime number?

(import (srfi :41))

(define (prime? x)
  (and (> x 1)
       (let loop ((divisor 2))
         (or (< x (expt divisor 2))
           (and (not (zero? (modulo x divisor)))
             (loop (1+ divisor)))))))

(display
  (stream-ref (stream-filter prime?
                             (stream-from 2))
              10000))
(newline)
