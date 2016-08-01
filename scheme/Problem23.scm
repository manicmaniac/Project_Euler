;;; A perfect number is a number for which the sum of its proper divisors is
;;; exactly equal to the number. For example, the sum of the proper divisors of 28
;;; would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
;;;
;;; A number n is called deficient if the sum of its proper divisors is less than n
;;; and it is called abundant if this sum exceeds n.
;;;
;;; As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
;;; number that can be written as the sum of two abundant numbers is 24. By
;;; mathematical analysis, it can be shown that all integers greater than 28123 can
;;; be written as the sum of two abundant numbers. However, this upper limit cannot
;;; be reduced any further by analysis even though it is known that the greatest
;;; number that cannot be expressed as the sum of two abundant numbers is less than
;;; this limit.
;;;
;;; Find the sum of all the positive integers which cannot be written as the sum of
;;; two abundant numbers.

(import (ice-9 receive)
        (rnrs base)
        (srfi :1))

(define (factor x)
  (let loop ((x x)
             (divisor 2)
             (result '()))
    (if (< x divisor)
      result
      (receive (quot rem)
               (div-and-mod x divisor)
               (if (zero? (modulo x divisor))
                 (loop quot
                       divisor
                       (cons divisor result))
                 (loop x
                       (1+ divisor)
                       result))))))

(define (counter lst)
  (fold-right (lambda (x alist)
                (assv-set! alist
                           x
                           (1+ (or (assv-ref alist x)
                                   0))))
              '()
              lst))

(define (sum-of-divisors x)
  (- (apply *
            (map (lambda (key-and-value)
                   (let ((key (car key-and-value))
                         (value (cdr key-and-value)))
                     (1+ (let loop ((x key)
                                    (n value)
                                    (result 0))
                           (if (zero? n)
                             result
                             (loop x
                                   (1- n)
                                   (+ result (expt x n))))))))
                 (counter (factor x))))
     x))

(define (abundant? x)
  (> (sum-of-divisors x) x))

