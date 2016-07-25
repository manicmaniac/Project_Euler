(import (ice-9 poe)
        (srfi :1))

(define (collatz-next x)
  (if (even? x)
    (/ x 2)
    (1+ (* 3 x))))

(define (collatz-depth x)
  (if (eqv? 1 x)
    1
    (1+ (cached-collatz-depth (collatz-next x)))))

(define cached-collatz-depth
  (pure-funcq collatz-depth))

(display
  (car (fold-right (lambda (x deepest)
                     (let ((depth (collatz-depth x)))
                       (if (> depth (cdr deepest))
                         (cons x depth)
                         deepest)))
                   '(0 . 0); (index . depth)
                   (iota 999999 1))))
(newline)
