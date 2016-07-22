;;; The prime factors of 13195 are 5, 7, 13 and 29.
;;;
;;; What is the largest prime factor of the number 600851475143 ?

(import (ice-9 receive)
        (rnrs base))

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


(display
  (apply max
         (factor 600851475143)))
(newline)
