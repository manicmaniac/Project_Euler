(import (ice-9 receive)
        (rnrs base)
        (srfi :1)
        (srfi :41))

(define triangulars
  (stream-map (lambda (x)
                (* 1/2 x (1+ x)))
              (stream-from 1)))

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

(define (divisors-count x)
  (apply *
         (map (compose 1+ cdr)
              (counter (factor x)))))

(display
  (stream-car (stream-drop-while (lambda (x)
                                   (> 500 (divisors-count x)))
                                 triangulars)))
(newline)
