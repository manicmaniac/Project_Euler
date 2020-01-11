;;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;;;
;;; Find the sum of all the primes below two million.

(import (srfi :1))

(define (sieve lst)
  (let loop ((head (car lst))
             (tail (cdr lst))
             (result '()))
    (if (< (last tail) (expt head 2))
      (append (reverse result)
              (cons head tail))
      (loop (car tail)
            (remove (lambda (x)
                      (zero? (modulo x head)))
                    (cdr tail))
            (cons head result)))))

(define (primes-to x)
  (sieve (iota (1- x) 2)))

(display
  (fold + 0
        (primes-to 2e6)))
