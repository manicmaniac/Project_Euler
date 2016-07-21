;;; Surprisingly there are only three numbers that can be written as the sum of
;;; fourth powers of their digits:
;;;
;;;     1634 = 1^4 + 6^4 + 3^4 + 4^4
;;;     8208 = 8^4 + 2^4 + 0^4 + 8^4
;;;     9474 = 9^4 + 4^4 + 7^4 + 4^4
;;;
;;; As 1 = 1^4 is not a sum it is not included.
;;;
;;; The sum of these numbers is 1634 + 8208 + 9474 = 19316.
;;;
;;; Find the sum of all the numbers that can be written as the sum of fifth powers
;;; of their digits.

(import (ice-9 receive)
        (rnrs base)
        (srfi :1))

(define (digits x)
  (let loop ((x x)
             (result '()))
    (if (zero? x)
      result
      (receive (quot rem)
               (div-and-mod x 10)
               (loop quot
                     (cons rem
                           result))))))


(define (armstrong? n x)
  (eqv? x
        (apply +
               (map (lambda (x)
                      (expt x n))
                    (digits x)))))

(display
  (apply +
         (filter (lambda (x)
                   (armstrong? 5 x))
                 (iota (* 6
                          (expt 9 5))
                       2))))
(newline)
