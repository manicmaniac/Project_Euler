;;; n! means n × (n − 1) × ... × 3 × 2 × 1
;;;
;;; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
;;; and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
;;;
;;; Find the sum of the digits in the number 100!

(import (ice-9 receive)
        (rnrs base))

(define (factorial x)
  (if (eqv? x 1)
    1
    (* x (factorial (1- x)))))

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

(display
  (apply +
         (digits (factorial 100))))
(newline)
