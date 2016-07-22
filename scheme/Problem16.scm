;;; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
;;;
;;; What is the sum of the digits of the number 2^1000?

(import (ice-9 receive)
        (rnrs base))

(define (digits x)
  (if (zero? x) 0
    (let loop ((x x)
               (result '()))
      (if (zero? x)
        result
        (receive (quot rem)
                 (div-and-mod x 10)
                 (loop quot
                       (cons rem
                             result)))))))

(display
  (apply +
         (digits (expt 2 1000))))
(newline)
